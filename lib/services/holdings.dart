class Holdings {
  Map tokenMap = {
    'bitcoin': {'BTC', 13.2},
    'ethereum': {'ETH', 250},
    'polkadot': {'DOT', 15079},
    'dash': {'DASH', 34.9},
    'zcash': {'ZEC', 256},
    'cardano': {'ADA', 54856},
    'binancecoin': {'BNB', 263},
    'bitcoin-cash': {'BCH', 70},
    'iota': {'IOTA', 22386},
    'waltonchain': {'WTC', 22386},
    'status': {'SNT', 42311},
    'civic': {'CVC', 35938},
    'sushi': {'SUSHI', 0},
    'trustswap': {'SWAP', 22000},
    'omisego': {'OMG', 2380},
    'pha': {'PHA', 144270},
    'polkastarter': {'POLS', 23781},
    'oraichain-token': {'ORAI', 433},
    'chiliz': {'CHZ', 55978},
    'pancakeswap-token': {'CAKE', 3884},
    'polkadex': {'PDEX', 2167},
    'ripple': {'XRP', 28161},
    'stellar': {'XLM', 70598},
    'monero': {'XMR', 61},
    'ethereum-classic': {'ETC', 438},
    'xflr': {'XFLR', 0},
    'avalanche-2': {'AVAX', 2567},
    'neo': {'NEO', 2035},
    'solana': {'SOL', 436},
    'republic-protocol': {'REN', 65005},
    'aave': {'AAVE', 50.8},
  };

  Map getHoldings() {
    return tokenMap;
  }
}
// portfolio = {'BTC':18.2, 'ETH':227, 'DASH':34.9, 'ZEC':256, 'BCH':70, 'BNB': 110.5, 'DOT': 14400, 'IOTA': 22386, 
//'ADA':175, 'WTC': 1561, 'SNT': 42311, 'CVC': 35398, 'OMG':2380, 'NEO': 2035, 'SWAP': 22000, 'PHA': 144270, i
//'POLS': 23781, 'ORAI':433, 'CHZ': 55978, 'CAKE': 3050, 'PDEX': 2167, 'XRP': 28161, 'STR': 79578, 'XMR': 61, 'ETC': 438, 
//'XFLR': 28161, 'AVAX': 3567}
