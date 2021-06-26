((element (start_tag (tag_name)) (text) @property)
	(#match? @property "\{"))

(start_tag
	(attribute (quoted_attribute_value (attribute_value) @method))
	(#match? @method "[\(\)]")
) 
