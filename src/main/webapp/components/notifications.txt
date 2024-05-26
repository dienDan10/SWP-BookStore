<c:if test="${not empty successMsg}">
           <div class="hidden" id="msg" type="success">${successMsg}</div>
           <c:remove var="successMsg" scope="session"></c:remove>
</c:if>
<c:if test="${not empty errMsg}">
           <div class="hidden" id="msg" type="error">${errMsg}</div>
           <c:remove var="errMsg" scope="session"></c:remove>
</c:if>
<c:if test="${not empty invalidMsg}">
           <div class="hidden" id="msg" type="invalid">${invalidMsg}</div>
           <c:remove var="invalidMsg" scope="session"></c:remove>
</c:if>
<div id="toastBox"></div>