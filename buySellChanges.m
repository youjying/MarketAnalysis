function finalCapital = buySellChanges( startingCapital, marketData, buySellRatio)
    availableCash = startingCapital;
    tradeCash = availableCash / 2 ;
    availableCash -= tradeCash;
    currentMarketData = marketData(1);
    numberOfSharesToBuy = tradeCash / currentMarketData;
    numberOfShares = numberOfSharesToBuy;
    tradeCash = 0;
    lastBuySell = currentMarketData;
    %run through all the marketData
    maxI = (size(marketData,2));
    for i = 2:maxI
        currentMarketData = marketData(i);
        currentMarketChange = (currentMarketData - lastBuySell)/lastBuySell;
        absoluteChange = abs(currentMarketChange);
        %we should buy/sell now
        if(currentMarketChange > 0)
            %the change is positive, we should capitalize our gains
            tradeCash = (numberOfShares * currentMarketData - numberOfShares * lastBuySell) * buySellRatio;
            numberOfSharesToSell = tradeCash / currentMarketData;
            numberOfShares -= numberOfSharesToSell;
            availableCash += tradeCash;
            tradeCash = 0;
        else
            %the change is negative, it's a good time to buy
            tradeCash = ( numberOfShares * lastBuySell - numberOfShares * currentMarketData) * buySellRatio;
            numberOfSharesToBuy = tradeCash / currentMarketData;
            availableCash -= tradeCash;
            numberOfShares += numberOfSharesToBuy;
            tradeCash = 0;
        endif
        lastBuySell = currentMarketData;
    endfor
    finalCapital = availableCash + numberOfShares * currentMarketData;
endfunction