#is this a comment
ourMoney = 10000
%sampleMarketData = [100,111,101,102,105,103,99.5,100.6,100.7,120,96,94,93,92,91,90,80,75,70,65,66,68,70,72,75,76,80,82,86,84,89,93,95,98,101,100];
load yahoo.mat
sampleMarketData = fliplr(AdjClose);
sampleChangeLimit = .01
sampleBuySellRatio = .01

linearBuyingSelling = linearBuySell(ourMoney, sampleMarketData, sampleChangeLimit, sampleBuySellRatio)
oneTimeInvestment = noBuySell(ourMoney,sampleMarketData)
equalBuyingSelling = equalBuySell(ourMoney,sampleMarketData)
homeostasisInvestment = buySellChanges(ourMoney,sampleMarketData,1)
movingHomeostasisInvestment = buySellChanges(ourMoney,sampleMarketData,.25)