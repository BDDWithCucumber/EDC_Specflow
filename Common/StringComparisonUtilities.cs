using System;
using System.Collections.Generic;

namespace Common
{
    public static class StringComparisonUtilities
    {
        public static bool IsFilterCriteriaMatched(List<String> valueList, String filterText, String filterCriteria)
        {
            switch (filterCriteria)
            {
                case "Is equal to": return IsFilterCriteriaMatched_IsEqualTo(valueList, filterText);
                case "Equal to": return IsFilterCriteriaMatched_IsEqualTo(valueList, filterText);
                case "Is not equal to": return IsFilterCriteriaMatched_IsNotEqualTo(valueList, filterText);
                case "Starts with": return IsFilterCriteriaMatched_StartsWith(valueList, filterText);
                case "Contains": return IsFilterCriteriaMatched_Contains(valueList, filterText);
                case "Does not contain": return IsFilterCriteriaMatched_DoesNotContain(valueList, filterText);
                case "Ends with": return IsFilterCriteriaMatched_EndsWith(valueList, filterText);
                default:
                    return false;
            }
        }
        public static bool IsFilterCriteriaMatched_IsEqualTo(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (!filterText.Equals(value, StringComparison.InvariantCultureIgnoreCase))
                {
                    return false;
                }
            }
            return true;
        }
        public static bool IsFilterCriteriaMatched_IsNotEqualTo(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (filterText.Equals(value, StringComparison.InvariantCultureIgnoreCase))
                {
                    return false;
                }
            }
            return true;
        }
        public static bool IsFilterCriteriaMatched_StartsWith(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (!value.StartsWith(filterText, StringComparison.InvariantCultureIgnoreCase))
                {
                    return false;
                }
            }
            return true;
        }
        public static bool IsFilterCriteriaMatched_Contains(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (!value.Contains(filterText))
                {
                    return false;
                }
            }
            return true;
        }
        public static bool IsFilterCriteriaMatched_DoesNotContain(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (value.Contains(filterText))
                {
                    return false;
                }
            }
            return true;

        }
        public static bool IsFilterCriteriaMatched_EndsWith(List<String> valueList, String filterText)
        {
            foreach (String value in valueList)
            {
                if (!value.EndsWith(filterText, StringComparison.InvariantCultureIgnoreCase))
                {
                    return false;
                }
            }
            return true;
        }
    }
}