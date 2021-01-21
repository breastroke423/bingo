# numS：ビンゴサイズを取得
numS = gets.chomp.to_i
# array_words配列としてnumSサイズ分だけ取得
array_words = []
# 0or1で当たり判定　0：選ばれていない　1：選ばれている
# array_checkは当たり判定用の配列とする
array_check = Array.new(numS) { Array.new(numS,0) }
# numS回whileで回すためにcountで何周したか確認
count = 0
while count < numS
    # 一行ずつ配列を取得
    words= gets.chomp.split(" ")
    #  配列に追加
    array_words.push(words)
    count += 1
end

# ビンゴワード数をnumNとして取得
numN = gets.chomp.to_i
# numN回whileで回すためにcheck_countで何周したか確認
check_count = 0
while check_count < numN
    # check_wordとしてあたりを確認する単語を取得
    check_word = gets.chomp
    # i:縦j:横として配列の番号を取得、当たり判定に反映
    i = 0
    while i < numS
        j = 0
        while j < numS
            if array_words[i][j] == check_word
                array_check[i][j] = 1
            end
            # checking = [i,j]
            # p checking
            j+=1
        end
        i += 1
    end
    check_count +=1
end

# ビンゴとなっているかをフラグで管理。標準：false
bingo_flag = "false"

# [縦,横,右肩下がり斜め,左肩下がり斜め]でフラグを管理。最後にビンゴ判定
bingo_flag_array = ["false","false","false","false"]

# 縦のビンゴチェック。1="true"としてフラグ確認。標準を"true"として0が来たら"false"。
bingo_check_v = "true"
l = 0
l_l = 0
while l < numS
    while l_l < numS
        if array_check[l][l_l] == 0
            bingo_check_v ="false"
            break
        end
        l_l += 1
    end
    l += 1
end
if bingo_check_v== "true"
    bingo_flag_array[0] = "true"    
end

# デフォルトのフラグを"false"として、配列に0が含まれていなかったら"true"として横のビンゴの判定
bingo_check_s = "false"
m = 0
while m < numS
    unless array_check[m].include?(0)
        bingo_flag_array[1] = "true"
        break
    end
    m += 1
end

# 右肩下がりのビンゴチェック。1="true"としてフラグ確認。標準を"true"として0が来たら"false"。

bingo_check_r = "true"
n = 0
while n < numS
    if 
        array_check[n][n] == 0
        bingo_check_r ="false"
        break
    end
    n += 1
end
if bingo_check_r == "true"
    bingo_flag_array[2] = "true"    
end

# 左肩下がりのビンゴチェック。1="true"としてフラグ確認。標準を"true"として0が来たら"false"。

bingo_check_l = "true"
o = 0
while o < numS
    if 
        array_check[o][numS-1-o] == 0
        bingo_check_l ="false"
        break
    end
    o += 1
end
if bingo_check_l == "true"
    bingo_flag_array[3] = "true"    
end

# bingo_flag_arrayの内一つでも"true"=bingoがあった場合はyesを出力、ない場合はnoを出力
if bingo_flag_array.include?("true")
    puts "yes"
else
    puts "no"
end