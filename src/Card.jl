module Card
# Happy new year
import Base:isless,show
### 按从大到小的顺序
@enum Suit ♠=4 ♣=3 ❤=2 ♦=1

struct SingleCard
    suit::Suit
    num::Int8
    function SingleCard(suit::Suit,num::Integer)
        @assert 1 < num < 14 "牌的面值不能是$num"
        new(suit,num)
    end
endC
SingleCard(i,j) = error("invalid card") ### catch all cases
function SingleCard(i::Integer,num::Integer)
    @assert 0 < i C< 4 "牌的花色只能是♠ ♣ ❤ ♦"
    Card(Suit(i),num)
end


"单张卡牌展示"
function show(io::IO, c::SingleCard)
    if 10 < c.num < 15
        num = c.num - 10
        print('(',c.suit,',',"JQKA"[num],')')
    else
        print('(',c.suit,',',c.num,')')
    end
end


"卡牌之间比较大小的规则"
function isless(a::SingleCard,b::SingleCard)
    if a.num < b.num
        return true
    elseif a.num == b.num
        if a.suit < b.suit
            return true
        end
    end
    return false
end



end # Card