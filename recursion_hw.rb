def sum_to(n)
    return n if n == 1
    return nil if n < 1
    n + sum_to(n-1)
end

def add_numbers(nums_array)
    return nums_array.first if nums_array.length == 1
    return nil if nums_array.length == 0

    nums_array.first + add_numbers(nums_array[1..-1])
end

def gamma_fnc(n)
    return nil if n == 0
    return 1 if n == 1

    (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
    if flavors.length == 1
        if flavors.first == favorite
            return true
        else
            return false
        end
    elsif flavors.length == 0
        return false
    else
        flavors.first == favorite || ice_cream_shop(flavors[1..-1], favorite)
    end
end

def reverse(str)
    return str if str.length <= 1
    str[-1] + reverse(str[0...-1])
end
