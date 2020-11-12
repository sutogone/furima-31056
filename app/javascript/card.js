const pay = () => {
  Payjp.setPublickey(process.env.PAYJP_PUBLIC_KEY);   //テスト用公開キー
  const form = document.getElementById("charge-form");                          //カード情報入力フォーム全体のidを取得
  form.addEventListener("submit", (e) => {                                      //購入ボタンを押してもサーバーサイドへリクエストが送られないように設定
    e.preventDefault();

    const formResult = document.getElementById("charge-form");                   //カード情報入力フォーム全体のidを取得
    const formData = new FormData(formResult);                                  //カード情報入力フォームの値を取得できるようにオブジェクトを生成

    const card = {
      number: formData.get("buy[number]"),                            //カードナンバーの情報を取得
      cvc: formData.get("buy[cvc]"),                                  //セキュリティコードの情報を取得
      exp_month: formData.get("buy[exp_month]"),                      //有効期限（年）の情報を取得
      exp_year: `20${formData.get("buy[exp_year]")}`,                  //有効期限（月）の情報を取得
    };

    Payjp.createToken(card, (status, responce) => {                             //第一引数にcard変数の内容が、第二引数にそれぞれHTTPステータスコード、レスポンスの内容が入る
      if (status == 200) {                                                      //もしHTTPステータスコードが200を返してきたら
        const token = responce.id;                                              //レスポンスで返されたトークンの値を変数tokenへ代入
        const renderDom = document.getElementById("charge-form")                //カード情報入力フォーム全体のidを取得
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;   //value(値)のなかにトークンを代入、hiddenで見えないようにし、nameはプロパティ名tokenを示す
        renderDom.insertAdjacentHTML("beforeend", tokenObj);                    //beforeendとすることで子要素の最後の部分(送信ボタンの横)にトークンを描画
      }
      document.getElementById("card-number").removeAttribute("name");           //formに存在するカードの各情報を削除
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();                          //フォームの情報をサーバーサイドに送信
    });
  });
};

window.addEventListener("load", pay);                                           //ページが読み込まれたら関数payを実行