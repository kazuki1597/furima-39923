window.addEventListener('turbo:load', () => {
    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
    //   console.log(inputValue);確認用
    // 復習のために残しときます
      const addTaxDom = document.getElementById("calculateFee");
      
      // 価格 * 0.1 で計算し、小数点以下を切り捨てて整数に変換
      const calculatedTax = Math.floor(inputValue * 0.1);
      
      addTaxDom.innerHTML = calculatedTax;

      const addprofitDom = document.getElementById("profit");
      const calculatedprofit = inputValue - calculatedTax;
      addprofitDom.innerHTML = calculatedprofit;
    });
  });
  