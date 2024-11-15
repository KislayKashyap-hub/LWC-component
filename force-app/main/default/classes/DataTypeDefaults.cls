public class DataTypeDefaults {

    public static Boolean getDefaultBoolean() {
        return false;
    }

    public static Integer getDefaultInteger() {
        return 0;
    }

    public static Long getDefaultLong() {
        return 0L;
    }

    public static Double getDefaultDouble() {
        return 0.0;
    }

    public static Decimal getDefaultDecimal() {
        return 0.0;
    }

    public static String getDefaultString() {
        return '';
    }

    public static Date getDefaultDate() {
        return Date.newInstance(1900, 1, 1);
    }

    public static Datetime getDefaultDatetime() {
        return Datetime.newInstance(1900, 1, 1, 0, 0, 0);
    }

    public static Time getDefaultTime() {
        return Time.newInstance(0, 0, 0, 0);
    }

    public static Id getDefaultId() {
        return null;
    }

    public static Blob getDefaultBlob() {
        return Blob.valueOf('');
    }

    public static List<String> getDefaultList() {
        return new List<String>();
    }

    public static Set<String> getDefaultSet() {
        return new Set<String>();
    }

    public static Map<String, String> getDefaultMap() {
        return new Map<String, String>();
    }
}