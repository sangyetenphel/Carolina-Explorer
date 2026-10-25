package com.carolina_explorer.service;

import com.carolina_explorer.entity.*;
import com.carolina_explorer.repository.BookingRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class BookingServiceTest {

    private static final long GUIDE_ID = 1L;
    private static final long OTHER_GUIDE_ID = 2L;
    private static final long TOURIST_ID = 3L;
    private static final long OTHER_TOURIST_ID = 4L;

    @Mock
    private BookingRepository bookingRepository;

    @InjectMocks
    private BookingService bookingService;

    private Booking booking;

    @BeforeEach
    void setUp() {
        TourGuide guide = new TourGuide();
        guide.setUserId(GUIDE_ID);

        Tour tour = new Tour();
        tour.setTourGuide(guide);

        Tourist tourist = new Tourist();
        tourist.setUserId(TOURIST_ID);

        booking = new Booking();
        booking.setBookingId(10L);
        booking.setTour(tour);
        booking.setTourist(tourist);
        booking.setStatus(BookingStatus.PENDING);
    }

    @Test
    void guideCanAcceptBookingForOwnTour() {
        when(bookingRepository.findById(10L)).thenReturn(Optional.of(booking));

        bookingService.acceptBooking(10L, GUIDE_ID);

        assertEquals(BookingStatus.ACCEPTED, booking.getStatus());
        verify(bookingRepository).save(booking);
    }

    @Test
    void guideCannotAcceptBookingForAnotherGuidesTour() {
        when(bookingRepository.findById(10L)).thenReturn(Optional.of(booking));

        ResponseStatusException ex = assertThrows(ResponseStatusException.class,
                () -> bookingService.acceptBooking(10L, OTHER_GUIDE_ID));

        assertEquals(HttpStatus.FORBIDDEN, ex.getStatusCode());
        assertEquals(BookingStatus.PENDING, booking.getStatus());
        verify(bookingRepository, never()).save(any());
    }

    @Test
    void guideCannotRejectBookingForAnotherGuidesTour() {
        when(bookingRepository.findById(10L)).thenReturn(Optional.of(booking));

        assertThrows(ResponseStatusException.class,
                () -> bookingService.rejectBooking(10L, OTHER_GUIDE_ID));

        assertEquals(BookingStatus.PENDING, booking.getStatus());
        verify(bookingRepository, never()).save(any());
    }

    @Test
    void touristCanCancelOwnBooking() {
        when(bookingRepository.findById(10L)).thenReturn(Optional.of(booking));

        bookingService.cancelBooking(10L, TOURIST_ID);

        assertEquals(BookingStatus.CANCELLED, booking.getStatus());
    }

    @Test
    void touristCannotCancelSomeoneElsesBooking() {
        when(bookingRepository.findById(10L)).thenReturn(Optional.of(booking));

        assertThrows(ResponseStatusException.class,
                () -> bookingService.cancelBooking(10L, OTHER_TOURIST_ID));

        assertEquals(BookingStatus.PENDING, booking.getStatus());
        verify(bookingRepository, never()).save(any());
    }

    @Test
    void missingBookingReturnsNotFound() {
        when(bookingRepository.findById(99L)).thenReturn(Optional.empty());

        ResponseStatusException ex = assertThrows(ResponseStatusException.class,
                () -> bookingService.acceptBooking(99L, GUIDE_ID));

        assertEquals(HttpStatus.NOT_FOUND, ex.getStatusCode());
    }
}
