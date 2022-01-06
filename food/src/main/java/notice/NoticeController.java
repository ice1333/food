package notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;

}
