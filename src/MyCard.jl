module MyCard
# Happy new year
import Base: isless, show, (-)
import Base: convert, zero, (+)
import Base: rem

export SingleCard
export Suit, ♠, ♣, ♡, ♢

### 按从大到小的顺序
@enum Suit ♢ ♡ ♣ ♠
@enum King 🐍 🐉

struct SingleCard
	suit::Union{Suit,King}
	num::Int8
	function SingleCard(suit::Suit, num::Integer)
		1 < num < 14 || throw(DomainError("牌的面值不能是$num"))
		new(suit, num)
	end
	function SingleCard(suit::King)
		suit == King(0) ? new(King(0),98) : new(King(1),99)
	end
end
SingleCard(i, j) = throw(ArgumentError("Invalid Card")) ### catch all cases
function SingleCard(i::Integer, num::Integer)
	i in 0:3 || throw(ArgumentError("牌的花色只能是♠ ♣ ❤ ♦"))
	SingleCard(Suit(i), num)
end


"单张卡牌展示"
function show(io::IO, c::SingleCard)
	big_num = Symbol[:J, :Q, :K, :A]
	if c.num in 11:14
		num = c.num - 10
		show(io, (c.suit, big_num[num]))
	else
		show(io, (c.suit, c.num))
	end
end

"Suit转换规则"
convert(::Type{Suit}, x::Int) = Suit(x)

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

"可以定义一些奇怪的Suit的加减法"
-(a::Suit, b::Suit) = (suit = Int(a) - Int(b); suit < 1 ? Suit(1) : Suit(suit))
+(a::Suit, b::Suit) = (suit = Int(a) + Int(b); suit > 4 ? Suit(4) : Suit(suit))

end # MyCard
