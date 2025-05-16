// item_price.js

window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = parseInt(priceInput.value);

      if (inputValue >= 300 && inputValue <= 9999999) {
        const taxAmount = Math.floor(inputValue * 0.1);
        const profitAmount = inputValue - taxAmount;

        tax.textContent = taxAmount.toLocaleString();
        profit.textContent = profitAmount.toLocaleString();
      } else {
        tax.textContent = '';
        profit.textContent = '';
      }
    });
  }
});