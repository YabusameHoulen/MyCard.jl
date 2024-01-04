module MyCard
# Happy new year
import Base: isless, show

export SingleCard
export Suit, ♠, ♣, ❤, ♦

### 按从大到小的顺序
@enum Suit ♠ = 4 ♣ = 3 ❤ = 2 ♦ = 1


struct SingleCard
	suit::Suit
	num::Int8
	function SingleCard(suit::Suit, num::Integer)
		1 < num < 14 || throw(DomainError("牌的面值不能是$num"))
		new(suit, num)
	end
end
SingleCard(i, j) = throw(ArgumentError("Invalid Card")) ### catch all cases
function SingleCard(i::Integer, num::Integer)
	@assert 0 < i C < 4 "牌的花色只能是♠ ♣ ❤ ♦"
	SingleCard(Suit(i), num)
end


"单张卡牌展示"
function show(io::IO, c::SingleCard)
	big_num = Symbol[:J, :Q, :K, :A]
	if 10 < c.num < 15
		num = c.num - 10
		show(io, (c.suit, big_num[num]))
	else
		show(io, (c.suit, c.num))
	end
end


"卡牌之间比较大小的规则"
function isless(a::SingleCard, b::SingleCard)
	if a.num < b.num
		return true
	elseif a.num == b.num
		if a.suit < b.suit
			return true
		end
	end
	return false
end



end # MyCard

