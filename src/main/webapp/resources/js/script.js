// ��ȿ�� �˻�


jQuery(function (){ 
	jQuery('#save').click(function() { 
		var subject = jQuery('#form #subject').val(); 
		if (subject == '') { alert('������ �Է��ϼ���'); 
		return false; 
		}
		var content = jQuery('#form #content').val(); 
		if (content == '') { alert('������ �Է��ϼ���'); 
		return false; 
		}
		jQuery('#save').submit(); 
	}); 
		
	jQuery('#search').click(function() { 
		var searchStr = jQuery('#searchf #searchStr').val(); 
		if (searchStr == '') { alert('�˻�� �Է��ϼ���'); 
		return false; 
		}
		jQuery('#search').submit(); 
		}); 
		
		
	}); 







/*function checkAll() {
        if (!checkSubject(form.subject.value)) {
            return false;
        } else if (!checkContent(form.content.value)) {
            return false;
        }
        return true;
    }
*/
