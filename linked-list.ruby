load './Node.ruby'
require 'byebug'
class LinkedList
    attr_accessor :next_node , :head , :value
    def initialize(val)
        @value = 1
        @head = Node.new(val , 0)
        
    end

    def append(value)
        new_node = Node.new(value,@value)
        if @head.next_node == nil
            @head.next_node_adder(new_node)
        else
            temp = @head
            i = 1
            while i < @value
                temp = temp.next_node
                temp.next_node_adder(new_node) if temp.next_node.nil?
                i +=1
            end
        end
        @value += 1
    end


    def prepend(node)
        new_node = Node.new(node , 0)
        temp_dup = @head.dup
        @head = new_node
        temp_add = @head
        i = 1
        temp_add.num+= 1 
        while i <= @value
            temp_add.next_node_adder(temp_dup)
            temp_add.next_node.num += 1
            temp_add = temp_add.next_node
            temp_dup = temp_dup.next_node
            i += 1
        end
        @value += 1
    end



    def size
        @value
    end

    def head
        @head
    end

    
    def tail
        i = 1
        temp = @head
        while i < @value
            temp = temp.next_node
            return temp if temp.next_node.nil?
            i+=1
        end
    end

    def at(index)
        i = 1
        temp = @head
        while i < @value
            temp = temp.next_node
            return temp if temp.num == index
            i+=1
        end
    end

    def pop
        temp = @head
        i = 1
        while i < @value - 1
            temp = temp.next_node
            temp.next_node = nil if temp.num == @value - 2
            i +=1
        end
        @value -= 1
    end

    def contains?(value)
        temp = @head
        i = 1
        return true if temp.val == value
        while i < @value
            temp = temp.next_node
            return true if temp.val == value
            i +=1
        end
        return false
    end

    def find(value)
        temp = @head
        i = 1
        if temp.val == value
            return temp.num
        end
        while i < @value
            temp = temp.next_node
            return temp.num if temp.val == value
            i +=1
        end
        return nil
    end

    def to_s
        str = ""
        temp = @head
        i = 1
        str += "( #{temp.val} ) -> "
        while i <= @value
            if temp.next_node.nil?
                str+="( nil )"
            else
            temp = temp.next_node
            str += "( #{temp.val} ) -> "
            end
            i +=1
        end
        return str
    end
end

val = LinkedList.new(5)

val.append(7)
val.append(8)
val.prepend(10)
val.append(9)
val.append(10)
val.append(9)
val.append(6)
val.append(2)
p val.to_s