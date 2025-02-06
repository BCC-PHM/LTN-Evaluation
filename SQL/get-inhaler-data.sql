SELECT 
       [AgeBands]
      ,[ItemActualCost]
      ,[ItemCount]
      ,[PatientLSOA]
	  ,[ProcessingPeriodDate]

  FROM [EAT_Reporting_BSOL].[Other].[VwPCareMeds]
  WHERE PaidBNFCode IN ('0301011ABBBAAA0', '0302000C0AAAAAA', '0302000C0AAABAB', '0302000C0AAACAC', 
  '0302000C0AAAEAE', '0302000C0AAAFAF', '0302000C0AAAGAG', '0302000C0AAAHAH', '0302000C0AAAIAI', 
  '0302000C0AAAJAJ', '0302000C0AAAKAK', '0302000C0AAALAL', '0302000C0AAAQAQ', '0302000C0AAARAR', 
  '0302000C0AAASAS', '0302000C0AAATAT', '0302000C0AAAUAU', '0302000C0AABEBE', '0302000C0AABFBF', 
  '0302000C0AABGBG', '0302000C0AABHBH', '0302000C0AABIBI', '0302000C0AABJBJ', '0302000C0AABKBK', 
  '0302000C0AABSBS', '0302000C0AABUBU', '0302000C0AABVBV', '0302000C0AABWBW', '0302000C0AABXBX', 
  '0302000C0AABYBY', '0302000C0AABZBZ', '0302000C0AACACA', '0302000C0BBAAAC', '0302000C0BBACAJ', 
  '0302000C0BBADAQ', '0302000C0BCACAE', '0302000C0BCADAF', '0302000C0BCAGAI', '0302000C0BCAHAB', 
  '0302000C0BCAIAA', '0302000C0BCAQAR', '0302000C0BDAAAN', '0302000C0BDABAP', '0302000C0BDACBL', 
  '0302000C0BEAAAS', '0302000C0BEABAU', '0302000C0BEACAT', '0302000C0BFAAAA', '0302000C0BFABAB', 
  '0302000C0BFACAC', '0302000C0BFADAS', '0302000C0BFAEAT', '0302000C0BFAFAU', '0302000C0BFAGAR', 
  '0302000C0BGAAAA', '0302000C0BGABAB', '0302000C0BGACAC', '0302000C0BHAAAG', '0302000C0BHABAL', 
  '0302000C0BHACAH', '0302000C0BHADAK', '0302000C0BHAEAJ', '0302000C0BHAFAQ', '0302000C0BIADBI', 
  '0302000C0BIAEBJ', '0302000C0BIAFBK', '0302000C0BJAABE', '0302000C0BJABBF', '0302000C0BJACBG', 
  '0302000C0BJADBH', '0302000C0BJAEBG', '0302000C0BJAFBH', '0302000C0BMAAAE', '0302000C0BMABAF', 
  '0302000C0BMACAI', '0302000C0BNAABU', '0302000C0BPAABE', '0302000C0BPABBF', '0302000C0BPACBV', 
  '0302000C0BPADBW', '0302000C0BQAABX', '0302000C0BQABBZ', '0302000C0BRAABY', '0302000C0BRABCA', 
  '0302000C0BSAABE', '0302000C0BSABBF', '0302000C0BTAABE', '0302000C0BTABBV', '0302000C0BTACBF', 
  '0302000C0BTADBW', '0302000K0AAAAAA', '0302000K0AAADAD', '0302000K0AAAGAG', '0302000K0AAAHAH', 
  '0302000K0AAAIAI', '0302000K0AAAJAJ', '0302000K0AAAKAK', '0302000K0AAALAL', '0302000K0AAAMAM', 
  '0302000K0AAARAR', '0302000K0AAASAS', '0302000K0AAATAT', '0302000K0AAAUAU', '0302000K0AAAVAV', 
  '0302000K0AAAWAW', '0302000K0AAAZAZ', '0302000K0AABABA', '0302000K0AABBBB', '0302000K0BBADAD', 
  '0302000K0BBAEAA', '0302000K0BBAGAI', '0302000K0BBAHAG', '0302000K0BBAIAH', '0302000K0BBAJAJ', 
  '0302000K0BBAKAK', '0302000K0BBALAT', '0302000K0BBAMAZ', '0302000K0BBANBA', '0302000K0BDAAAL', 
  '0302000K0BDABAM', '0302000K0BDACAU', '0302000K0BDADBB', '0302000K0BEAAAR', '0302000K0BEABAS', 
  '0302000K0BFAAAV', '0302000K0BGAAAK', '0302000K0BHAAAM', '0302000K0BHABAU', '0302000K0BIAAAU', 
  '0302000K0BIADAL', '0302000N0AAAAAA', '0302000N0AAABAB', '0302000N0AAACAC', '0302000N0AAADAD', 
  '0302000N0AAAEAE', '0302000N0AAAFAF', '0302000N0AAAGAG', '0302000N0AAAPAP', '0302000N0AAAQAQ', 
  '0302000N0AAARAR', '0302000N0AAASAS', '0302000N0AAATAT', '0302000N0AAAUAU', '0302000N0AAAXAX', 
  '0302000N0AAAYAY', '0302000N0AAAZAZ', '0302000N0AABABA', '0302000N0AABCBC', '0302000N0AABEBE', 
  '0302000N0AABFBF', '0302000N0AABGBG', '0302000N0AABHBH', '0302000N0AABJBJ', '0302000N0AABKBK', 
  '0302000N0AABLBL', '0302000N0AABPBP', '0302000N0AABQBQ', '0302000N0BBAAAA', '0302000N0BBABAB', 
  '0302000N0BBACAC', '0302000N0BBADAD', '0302000N0BBAEAE', '0302000N0BBAFAF', '0302000N0BBAGAG', 
  '0302000N0BBAPAP', '0302000N0BBAQAQ', '0302000N0BBARAR', '0302000N0BBASAS', '0302000N0BBATAT', 
  '0302000N0BBAUAU', '0302000N0BBBBBH', '0302000N0BCAAAX', '0302000N0BCABAY', '0302000N0BCACAZ', 
  '0302000N0BCADBE', '0302000N0BCAEBF', '0302000N0BCAFBG', '0302000N0BDAABJ', '0302000N0BDABBK', 
  '0302000N0BDACBL', '0302000N0BDADBP', '0302000N0BDAEBQ', '0302000N0BFAABF', '0302000N0BFABBG', 
  '0302000N0BGAAAZ', '0302000N0BGABBF', '0302000N0BGACBG', '0302000N0BHAAAZ', '0302000N0BIAABF', 
  '0302000N0BIABBG', '0302000N0BJAABF', '0302000N0BJABBG', '0302000N0BKAAAY', '0302000N0BKABAZ', 
  '0302000N0BLAABE', '0302000N0BLABBF', '0302000N0BLACBG', '0302000N0BMAAAZ', '0302000R0AAAAAA', 
  '0302000R0AAACAC', '0302000R0BBAAAA', '0302000R0BBACAC', '0302000U0AAAAAA', '0302000U0AAABAB', 
  '0302000U0BBAAAA', '0302000U0BBABAB', '0302000V0AAAAAA', '0302000V0AAABAB', '0302000V0BBAAAA', 
  '0302000V0BBABAB', '0302000V0BCAAA0')