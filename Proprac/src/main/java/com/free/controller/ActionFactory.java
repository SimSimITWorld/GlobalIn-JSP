package com.free.controller;

import com.free.action.CommentAction;
import com.free.action.ContentAction;
import com.free.action.DeleteAction;
import com.free.action.DeleteProcAction;
import com.free.action.ListAction;
import com.free.action.ReplyAction;
import com.free.action.UpdateAction;
import com.free.action.UpdateProcAction;
import com.free.action.WriteAction;
import com.free.action.WriteProcAction;

public class ActionFactory {

	private static ActionFactory factory;
	
	public ActionFactory() {}
	
	public static synchronized ActionFactory getInstance() {
		
		if(factory==null) {
			factory = new ActionFactory();
		}
		
		return factory;
	}
	
	public Action getAction(String free) {
		
		Action action = null;
		
		switch(free) {
			case "list":
				action = new ListAction();
				break;
			case "write":
				action = new WriteAction();
				break;
			case "writeProc":
				action = new WriteProcAction();
				break;
			case "content":
				action = new ContentAction();
				break;
			case "delete":
				action = new DeleteAction();
				break;
			case "deleteProc":
				action = new DeleteProcAction();
				break;
			case "update":
				action = new UpdateAction();
				break;
			case "updateProc":
				action = new UpdateProcAction();
				break;
			case "comment":
				action = new CommentAction();
				break;
			case "reply":
				action = new ReplyAction();
				break;
		}
		
		return action;
	}
	
}
