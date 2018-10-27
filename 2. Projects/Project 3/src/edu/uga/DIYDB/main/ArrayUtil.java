package edu.uga.DIYDB.main;

/****************************************************************************************
 * @file  ArrayUtil.java
 *
 * @author   John Miller
 */

import java.util.Arrays;

import static java.lang.System.arraycopy;

public class ArrayUtil 
{
    /************************************************************************************
     * Concatenate two arrays of type T to form a new wider array.
     *
     * @see http://stackoverflow.com/questions/80476/how-to-concatenate-two-arrays-in-java
     *
     * @param arr1  the first array
     * @param arr2  the second array
     * @return result  a wider array containing all the values from arr1 and arr2
     */
    public static <T> T [] concat (T [] arr1, T [] arr2) {
        T [] result = Arrays.copyOf (arr1, arr1.length + arr2.length);
        arraycopy (arr2, 0, result, arr1.length, arr2.length);
        return result;
    } // concat

} // ArrayUtil
