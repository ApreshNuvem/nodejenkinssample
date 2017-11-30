(function () {
   'use strict';
 /*============================================================================
      Author      : Adithya
      Module      : config.build
      Date        : 7-Nov-2017
      History     : 7-Nov-2017
      Description : Application server configuration & exporting to access it outside of the file
      tetete
      =========================================================================*/
exports.Build = {
    Type : 'Production', //Production OR Local
    Environment : {
        Local : {
            Host : 'locahost',
            Domain: '',
            Port : 3000,
            Protocol: 'HTTP',
						DB : {
								ConnectionLimitMax : 5,
                ConnectionLimitMin : 0,
                Idle : 1000,
                Url : 'postgres://appshark:aps@123@192.168.10.132:5432/test'
						}
        },
				Production : {
					Host : process.env.HOST,
					Domain: '',
					Port : process.env.PORT,
					Protocol: 'HTTP',
          DB : {
              ConnectionLimitMax : 5,
              ConnectionLimitMin : 0,
              Idle : 1000,
              Database : 'd9vgknh43ooldu',
              Host : 'ec2-23-21-85-76.compute-1.amazonaws.com',
              Port : ':5432',
              Password : '6a1fffcb9884f37a569dc7db611473f3a0df30b1dbd5a03c6fe200eb6edade40',
              UserName : 'dzqmcwtpxocfic',
              Url : 'postgres://dzqmcwtpxocfic:6a1fffcb9884f37a569dc7db611473f3a0df30b1dbd5a03c6fe200eb6edade40@ec2-23-21-85-76.compute-1.amazonaws.com:5432/d9vgknh43ooldu'
          }
				}
    }
};
}());
