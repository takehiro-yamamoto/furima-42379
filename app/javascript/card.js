  const pay = () => {
    const payjp = Payjp('pk_test_1b30ce1315041c9b3e29d9ef'); // PAY.JPテスト公開鍵

    // カード情報の要素作成
    const elements = payjp.elements();
    const numberElement = elements.create('cardNumber');
    const expiryElement = elements.create('cardExpiry');
    const cvcElement = elements.create('cardCvc');

    // カード情報フォームにマウント
    numberElement.mount('#number-form');
    expiryElement.mount('#expiry-form');
    cvcElement.mount('#cvc-form');

    // フォーム送信イベントに処理追加
    const form = document.getElementById('charge-form');
    form.addEventListener("submit", (e) => {

      // ここにトークン生成などの処理を後で追加
          payjp.createToken(numberElement).then(function (response) {
        if (response.error) {
        } else {
          const token = response.id;
          // HTML文字列で hidden input を挿入する
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input type="hidden" value=${token} name='token'>`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();
        document.getElementById("charge-form").submit();
      });
      e.preventDefault(); // フォームのデフォルトの送信をキャンセル
    });
  };

  window.addEventListener("turbo:load", pay)