#create users



anie = User.create(username: "Anie", email: "anie@anie.com", password: "password")


usha = User.create(username: "Usha", email: "usha@usha.com", password: "password")


#create book_reviews
anie.book_reviews.create(title: "Frankenstein", image: "https://images-na.ssl-images-amazon.com/images/I/416QjTxduzL._SX311_BO1,204,203,200_.jpg", content: "Few creatures of horror have seized readers' imaginations and held them for so long as the anguished monster of Mary Shelley's Frankenstein. The story of Victor Frankenstein's terrible creation and the havoc it caused has enthralled generations of readers and inspired countless writers of horror and suspense. ")

usha.book_reviews.create(title: "The Case of the Howling Dog (Perry Mason Series Book 4)", image: "https://images-na.ssl-images-amazon.com/images/I/41JG4ltTUPL.jpg", content: "Compared to a juicy murder trial, a case of feuding neighbors isn’t exactly Perry Mason’s cup of tea. But Arthur Cartright insists that Mason is the only one who can muzzle the howling hound that’s driving Cartright crazy.")
