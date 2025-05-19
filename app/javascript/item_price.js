// item_price.js

const calculatePrice = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = Math.floor(inputValue * 0.1);
    const profit = inputValue - tax;

if (isNaN(inputValue) || inputValue === "") {
      addTaxDom.innerHTML = "";
      profitDom.innerHTML = "";
    } else {
      addTaxDom.innerHTML = tax;
      profitDom.innerHTML = profit;
    }
  });
};

// Turboのイベントに対応させる
document.addEventListener("turbo:load", calculatePrice);
document.addEventListener("turbo:render", calculatePrice);