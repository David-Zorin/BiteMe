package enums;

public enum CustomerType {
	PRIVATE("Private"),
	BUSINESS("Business");
    private final String name;
    CustomerType(String name) {
        this.name = name;
    }

    public String toString() {
        return name;
    }
}
