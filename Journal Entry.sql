SELECT trans_batch_ctl.source_cde,   
         trans_batch_ctl.group_num,   
         trans_batch_ctl.grp_desc,   
         trans_batch_ctl.grp_dte,   
         trans_batch_ctl.grp_sts,   
         trans_hist.source_cde,   
         trans_hist.group_num,   
         trans_hist.trans_key_line_num,   
         trans_hist.trans_dte,   
         trans_hist.trans_amt,   
         trans_hist.acct_cde,   
         trans_hist.project_code,   
         trans_hist.id_num,   
         trans_hist.ap_sbs_id_num,   
         trans_hist.ap_sbs_cde_subsid,   
         trans_hist.offset_flag,   
         trans_hist.subsid_cde,   
         trans_hist.folio,   
         trans_hist.invoice_num,   
         trans_hist.payable_check_dte,   
         trans_hist.trans_po_num_grp_n,   
         trans_hist.po_line_num,   
         trans_hist.partial_order_po,   
         trans_hist.receipt_num,   
         trans_hist.trans_desc,   
         source_master.source_desc ,
		trans_hist.tax_refund_cde,
		trans_hist.tax_refund_amt
    FROM trans_batch_ctl,   
         trans_hist,   
         source_master  
   WHERE ( trans_batch_ctl.source_cde = trans_hist.source_cde ) and  
         ( trans_batch_ctl.group_num = trans_hist.group_num ) and  
         ( source_master.source_cde = trans_batch_ctl.source_cde ) and 
		( trans_batch_ctl.grp_sts = 'C' )  and TRANS_BATCH_CTL.SOURCE_CDE like 'JL';
    