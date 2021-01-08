@parse[string;tabs][_justATable;_tableKeyValue;_resultHash;_flag]
$code[^#0A$tabs^#2E]
$verticalCode[^#3A^#0A$tabs^#09^#2E]
$_justATable[^string.split[$code]]
$_resultHash[^hash::create[]]
^_justATable.foreach[number;row]{
	^if($row.piece ne ''){
			$_flag[true]
			$_tableKeyValue[^row.piece.split[$verticalCode]]
			^_tableKeyValue.foreach[n;r]{
			^if($_flag eq 'true' && $r.piece ne ''){
				$_key[$r.piece]
				$_flag[false]
			}{
				^if($r.piece ne ''){
					^if(^r.piece.match[^#3A^#0A]){
						$tabs[$tabs^#09]
						$_valueHash[^hash::create[]]
						$_valueHash[^parse[$r.piece;$tabs]]
						$_value[^hash::create[$_valueHash]]
					}{
						$_lastTable[^r.piece.split[^#3A]]
						^_lastTable.foreach[count;strow]{
							^if($count == 0){
								$_lastLevelKey[$strow.piece]
							}{
								$_lastLevelVal[$strow.piece]
							}		
						}
						$_valueHash[^hash::create[]]
						$_valueHash.$_lastLevelKey[$_lastLevelVal]
						$_value[^hash::create[$_valueHash]]
					}
					$_flag[true]	
				}
			}
		}
		$_resultHash[
			$.[$_key][$_value]
		]
	}
}
$result[$_resultHash]