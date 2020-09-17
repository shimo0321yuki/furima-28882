const pay = () => {
  Payjp.setPublicKey("pk_test_9fa247fd1dd02d6e5084c8d1");  // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchaser_order[number]"),
      cvc: formData.get("purchaser_order[CVC]"),
      exp_month: formData.get("purchaser_order[exp_month]"),
      exp_year: `20${formData.get("purchaser_order[exp_year]")}`,
    };
    for (let value of formData.entries()) { 
      console.log(value); 
    }
    console.log(card);

    Payjp.createToken(card, (status, response) => {
      console.log(response);
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      }
    });
  });
}

window.addEventListener("load", pay);