Public Class RptLaporanTransaksi

    Private Sub RptLaporanTransaksi_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DB_MICUDataSet.tbl_laporantransaksi' table. You can move, or remove it, as needed.
        Me.tbl_laporantransaksiTableAdapter.Fill(Me.DB_MICUDataSet.tbl_laporantransaksi)
        Me.ReportViewer1.RefreshReport()
    End Sub

End Class