class Summer
  def sum(list)
    index = 0
    result = 0

    while index < list.size
     result += list[index]
     index += 1
    end
    result
  end
end
