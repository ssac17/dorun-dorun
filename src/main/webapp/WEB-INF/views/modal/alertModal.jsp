<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="alertModal" tabindex="-1"
     aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header border-bottom-0">
                <h1 class="modal-title fs-5">알림</h1>
                <button type="button" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body py-0">
                <p id="alertMessage"></p>
            </div>
            <div class="modal-footer flex-column align-items-stretch w-100 gap-2 pb-3 border-top-0">
                <button type="button" class="btn btn-lg btn-primary" data-bs-dismiss="modal">
                    확인
                </button>
            </div>
        </div>
    </div>
</div>