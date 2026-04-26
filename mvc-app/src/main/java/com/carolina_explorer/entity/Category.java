package com.carolina_explorer.entity;

public enum Category {
    FOOD("Food & Drinks"),
    HISTORY("History & Culture"),
    NATURE("Nature & Outdoors"),
    ADVENTURE("Adventure");

    private final String displayName;

    Category(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}