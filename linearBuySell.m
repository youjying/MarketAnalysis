function finalCapital = linearBuySell( startingCapital, marketData, changeLimit, buySellRatio )
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
        if(abs(currentMarketChange) > changeLimit)
            %we should buy/sell now
            if(currentMarketChange > 0)
                %the change is positive, we should capitalize our gains
                numberOfSharesToSell = numberOfShares * buySellRatio;
                tradeCash = numberOfSharesToSell * currentMarketData;
                numberOfShares -= numberOfSharesToSell;
                availableCash += tradeCash;
                tradeCash = 0;
            else
                %the change is negative, it's a good time to buy
                tradeCash = availableCash * buySellRatio;
                availableCash -= tradeCash;
                numberOfSharesToBuy = tradeCash / currentMarketData;
                numberOfShares += numberOfSharesToBuy;
                tradeCash = 0;
            endif
            lastBuySell = currentMarketData;
        endif
    endfor
    finalCapital = availableCash + numberOfShares * currentMarketData;
endfunction