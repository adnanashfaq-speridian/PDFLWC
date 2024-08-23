import { LightningElement, track } from 'lwc';

export default class PDFLWC extends LightningElement {
    @track fromDate;
    @track toDate;

    handleFromDateChange(event) {
        this.fromDate = event.target.value;
    }

    handleToDateChange(event) {
        this.toDate = event.target.value;
    }

    handleSubmit() {
        const vfPageUrl = `/apex/PDFVfp?fromDate=${this.fromDate}&toDate=${this.toDate}`;
        window.open(vfPageUrl, '_blank');
    }
}
