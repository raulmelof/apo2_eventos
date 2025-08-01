<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Palestra, dao.PalestraDAO" %>
<%
    List<Palestra> listaDePalestras = null;
    PalestraDAO palestraDAO = new PalestraDAO();
    try {
        listaDePalestras = palestraDAO.listarParaProgramacao();
    } finally {
        palestraDAO.closeConnection();
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Check-in por QR Code</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        #qr-reader {
            width: 500px;
            max-width: 90%;
            border: 2px solid #ddd;
            border-radius: 5px;
            margin: auto;
        }
        #qr-reader__scan_region {
            background: rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

    <jsp:include page="common/navbar.jsp">
        <jsp:param name="activePage" value="checkin"/>
    </jsp:include>

    <div class="container my-5 text-center">
        <h1 class="mb-4">Check-in de Presença</h1>
        
        <div class="card shadow-sm mx-auto" style="max-width: 600px;">
            <div class="card-body">
                <div class="mb-3">
                    <label for="palestraSelect" class="form-label fs-5">Selecione a Palestra para Check-in:</label>
                    <select id="palestraSelect" class="form-select form-select-lg">
                        <option value="">-- Selecione uma palestra --</option>
                        <% if (listaDePalestras != null) { for (Palestra palestra : listaDePalestras) { %>
                            <option value="<%= palestra.getIdPalestra() %>"><%= palestra.getNomePalestra() %></option>
                        <% }} %>
                    </select>
                </div>
                
                <hr>

                <div id="qr-reader" class="mt-3"></div>
                <div id="qr-reader-results" class="mt-3 fs-5"></div>
                
                <button id="start-scan-btn" class="btn btn-primary mt-3" disabled>Iniciar Câmera</button>
            </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://unpkg.com/html5-qrcode" type="text/javascript"></script>

    <script>
        $(document).ready(function() {
            const resultContainer = document.getElementById('qr-reader-results');
            const startScanButton = $('#start-scan-btn');
            const palestraSelect = $('#palestraSelect');
            let html5QrCode = null;

            palestraSelect.on('change', function() {
                if ($(this).val()) {
                    startScanButton.prop('disabled', false);
                } else {
                    startScanButton.prop('disabled', true);
                    if (html5QrCode && html5QrCode.isScanning) {
                        html5QrCode.stop();
                    }
                }
            });

            startScanButton.on('click', function() {
                if (!html5QrCode) {
                    html5QrCode = new Html5Qrcode("qr-reader");
                }
                
                resultContainer.innerHTML = '<span class="text-muted">Aponte a câmera para o QR Code...</span>';
                
                const config = { fps: 10, qrbox: { width: 250, height: 250 } };
                
                html5QrCode.start({ facingMode: "environment" }, config, onScanSuccess, onScanFailure);
            });

             function onScanSuccess(decodedText, decodedResult) {
                 const idPalestra = palestraSelect.val();
                 
                 html5QrCode.stop().catch(err => console.error("Falha ao parar a câmera", err));

                 resultContainer.innerHTML = '<span class="text-info">Processando check-in para CPF: ' + decodedText + '...</span>';

                 $.ajax({
                     url: '${pageContext.request.contextPath}/admin/CheckinServlet',
                     type: 'POST',
                     data: {
                         cpfUsuario: decodedText,
                         idPalestra: idPalestra
                     },
                     dataType: 'json',
                     success: function(response) {
                         if (response.status === 'success') {
                             resultContainer.innerHTML = '<span class="text-success fw-bold">' + response.message + '</span>';
                         } else if (response.status === 'info') {
                             resultContainer.innerHTML = '<span class="text-warning fw-bold">' + response.message + '</span>';
                         } else {
                             resultContainer.innerHTML = '<span class="text-danger fw-bold">' + response.message + '</span>';
                         }
                     },
                     error: function() {
                         resultContainer.innerHTML = '<span class="text-danger fw-bold">Erro de comunicação com o servidor.</span>';
                     }
                 });
             }

            function onScanFailure(error) {
                // console.warn(`QR code scan failed. Reason: ${error}`);
            }
        });
    </script>
</body>
</html>