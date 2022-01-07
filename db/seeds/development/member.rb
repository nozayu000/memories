nicknames = %w(Hajime Yuki Jinne Lisa Rose Hacchi Jisoo Mark Jin Temin)
fnames = ["有田","徳井","博多","中川"]
gnames = ["和子","理沙","怜"]
0.upto(9) do |idx|
  Member.create(

    nickname: nicknames[idx],
    full_name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
    email: "#{nicknames[idx]}@exsample.com",
    birthday: "1990-04-01",
    public: [1,1,2][idx % 3],
    administrator: (idx == 0)
  )
end

