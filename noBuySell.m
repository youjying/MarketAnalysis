function finalCapital = noBuySell (startingCapital,marketData)
    numberOfShares = startingCapital / marketData(1);
    finalCapital = marketData(size(marketData,2))*numberOfShares;
endfunction