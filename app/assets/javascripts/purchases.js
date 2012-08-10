function startPayment(){
	doTransaction(document.PGIOForm);
}

function getPGIOresult() {
  verifyReceived(getPGIOElement('tid'), 'callbacksuccess', 'callbackfail');
}
 
function callbacksuccess() {
   var replycode = getPGIOElement('replycode');
   var replyMsg = getPGIOElement('replyMsg');
   if (replycode == '0000') {
     // 거래성공 경우 for transaction success
    //document.PGIOForm.action = '/purchases';
     document.PGIOForm.submit();
   } else {
     // 거래실패 경우 for transaction failuer
     alert(replyMsg);
	history.back();
    }
}
 
function callbackfail() {
  // paygate system error
	var replyMsg = getPGIOElement('replycode');
	alert("결제가 실패했습니다. 원인은 "+replyMsg+"입니다. 다시 시도해 주십시오.");
	history.back();
}
