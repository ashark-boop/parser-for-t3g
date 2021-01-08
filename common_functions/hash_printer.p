@printHash[hs]
^hs.foreach[key;value]{
	^if($value is hash){
		<div style="margin:3px 20px 0">
		$key ^printHash[$value]
		</div>
	}{	
		<div style="margin:3px 20px 0">
		$key^[$value^]
		</div>
	}
}