fn swap(arr: &mut [i32], i: usize, j: usize ) {
    let temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}

fn partition(arr: &mut [i32], start: usize, end: usize ) -> i32 {
    let pivot = arr[end];
    let mut index = start;
    let mut i = start;

    while i < end {
        if arr[i] < pivot {
            swap(arr, i, index);
            index+=1;
        }
 
        i+=1;
    }

    swap(arr, index, end);
    return index as i32;
}

fn quick_sort(arr: &mut [i32], start: usize, end: usize) {
    if start >= end {
        return;
    }

    let pivot = partition(arr, start, end);
    quick_sort(arr, start, (pivot - 1) as usize);
    quick_sort(arr, (pivot + 1) as usize, end);
}