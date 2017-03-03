class MyCounter
  def count(n, list)
    count = 0
    index = 0

    while index < list.size
      if list[index] >= n
        count += 1
      end
      index += 1
    end
    count
  end
end
