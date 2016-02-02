	function goBoardList(boardName){
		
		var action;
		
		switch (boardName) {
		
		//SIX 메인화면
		case 'SIX_ACADEMY': action = '/academy/academyMain.do';
		      break;
		case 'SIX_INFO': action = '/info/infoMain.do';
		      break;
		case 'SIX_COMMSPEICAL_BOARD': action = '/community/communitySpeical.do';
		      break;
		case 'SIX_MARKETFREE_BOARD': action = '/market/marketFree.do';
			  break;
		case 'SIX_MARKETISTRATEGY_BOARD': action = '/market/marketIstrategy.do';
			  break;
		case 'SIX_MARKETANALYSIS_BOARD': action = '/market/marketAnalysis.do';
		  	  break;
		case 'SIX_MARKETPAY_BOARD': action = '/market/marketPay.do';
		      break;
		case 'SIX_MARKETBARGAIN_BOARD': action = '/market/marketBargain.do';
		  	  break;
		case 'SIX_MARKETADV_BOARD': action = '/market/marketAdv.do';
		  	  break;
		case 'SIX_LEARNCENTER_BOARD': action = '/academy/academyLearningCenter.do';
		  	  break;
		case 'SIX_LEARNSTRATEGY_BOARD': action = '/academy/academyInvestStrategy.do';
		  	  break;
		case 'SIX_SNOTE_BOARD': action = '/academy/academySearchNote.do';
		  	  break;
		case 'SIX_INFOSECTECH_BOARD': action = '/info/infoSecTech.do';
		  	  break;
		case 'SIX_INFOSTOCKBRIEFING_BOARD': action = '/info/infoStockBriefing.do';
		  	  break;
		case 'SIX_INFOGINTERVIEW_BOARD': action = '/info/infoGInterview.do';
	  	  	  break;
	  	//SIX 일급정보 메인화면  	  
		case 'SIX_NSUBSCRIBE_BOARD': action = '/academy/academyNecessarySubscribe.do';
	  	  	  break;
		case 'SIX_INFOFREEREC_BOARD': action = '/info/infoFreeRec.do';
	  	  	  break;
		case 'SIX_INFOTHEME_BOARD': action = '/info/infoTheme.do';
	  	  	  break;
		case 'SIX_INFOREALSTOCK_BOARD': action = '/info/infoRealStock.do';
	  	  	  break;
		default:
		  	  break;
		}
		
		document.forms[0].action = action;
		document.forms[0].submit();
		
	}
	
	function goBoardView(boardName,seq){
		
		var action;
		$('#seq').val(seq);
		
		switch (boardName) {
		//SIX 메인화면
		case 'SIX_MARKETFREE_BOARD': action = '/market/marketFreeView.do';
			  break;
		case 'SIX_MARKETISTRATEGY_BOARD': action = '/market/marketIstrategyView.do';
			  break;
		case 'SIX_MARKETANALYSIS_BOARD': action = '/market/marketAnalysisView.do';
		  	  break;
		case 'SIX_MARKETPAY_BOARD': action = '/market/marketPayView.do';
		      break;
		case 'SIX_MARKETBARGAIN_BOARD': action = '/market/marketBargainView.do';
		  	  break;
		case 'SIX_MARKETADV_BOARD': action = '/market/marketAdvView.do';
		  	  break;
		case 'SIX_LEARNCENTER_BOARD': action = '/academy/academyLearningCenterView.do';
		  	  break;
		case 'SIX_LEARNSTRATEGY_BOARD': action = '/academy/academyInvestStrategyView.do';
		  	  break;
		case 'SIX_SNOTE_BOARD': action = '/academy/academySearchNoteView.do';
		  	  break;
		case 'SIX_INFOSECTECH_BOARD': action = '/info/infoSecTechView.do';
		  	  break;
		case 'SIX_INFOSTOCKBRIEFING_BOARD': action = '/info/infoStockBriefingView.do';
		  	  break;
		case 'SIX_INFOGINTERVIEW_BOARD': action = '/info/infoGInterviewView.do';
	  	  	  break;	  	
	  	//SIX 일급정보 메인화면  	  
		case 'SIX_NSUBSCRIBE_BOARD': action = '/academy/academyNecessarySubscribeView.do';
	  	  	  break;
		case 'SIX_INFOFREEREC_BOARD': action = '/info/infoFreeRecView.do';
	  	  	  break;
		case 'SIX_INFOTHEME_BOARD': action = '/info/infoThemeView.do';
	  	  	  break;
		case 'SIX_INFOREALSTOCK_BOARD': action = '/info/infoRealStockView.do';
	  	  	  break;
		default:
			  break;
		}
		alert(action);
		document.forms[0].action = action;
		document.forms[0].submit();
	}