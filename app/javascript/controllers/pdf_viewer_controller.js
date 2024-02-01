import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  connect() {
    this.setupAdobeDCView();
  }

  setupAdobeDCView() {
    const adobeDCView = new AdobeDC.View({
      clientId: "c7a2dd64ed4740e7b478919fd6b8de8c",
      divId: "adobe-dc-view",
    });

    const pdfUrl = this.element.dataset.pdfUrl;
    const pdfFilename = this.element.dataset.pdfFilename;

    adobeDCView.previewFile(
      {
        content: { location: { url: pdfUrl } },
        metaData: { fileName: pdfFilename },
      },
      { embedMode: "SIZED_CONTAINER", showFullScreen: true}
    );
  }
}
