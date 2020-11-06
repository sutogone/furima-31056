function item_price() {
  const itemPrice = document.getElementById("item-price");        //金額入力欄のidを取得し、内容を変数itemPriceに代入
  const addTaxPrice = document.getElementById("add-tax-price");   //販売手数料欄のidを取得し、内容を変数addTaxPriceに代入
  const profit = document.getElementById("profit");               //販売手数料欄のidを取得し、内容を変数profitに代入
  itemPrice.addEventListener('input', () => {                     //金額入力欄に何かしらの入力が行われたらイベント発火
    const inputTaxValue = itemPrice.value * 0.1;                  //itemPriceの値を取得し、その値の10%を取り出すので×0.1その後変数inputTaxValueに代入
    const salesProfit = itemPrice.value * 0.9;                    //itemPriceの値を取得し、その値の90%を取り出すので×0.9その後変数salesProfitに代入
    addTaxPrice.innerHTML = Math.floor(inputTaxValue);            //addTaxPriceの中にinputTaxValueの値を代入するまたMath.floorで小数点以下は切り捨て
    profit.innerHTML = Math.floor(salesProfit);                   //profitの中にsalesProfitの値を代入するまたMath.floorで小数点以下は切り捨て
  });
}

window.addEventListener('load', item_price);