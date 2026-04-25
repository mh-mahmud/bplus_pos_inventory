<?php
    $start_date = date("Y-m-d 00:00:00");
    $end_date = date("Y-m-d 23:59:59");
    $cus_end = date("Y-m-d 23:59:59");

	$tot_rcv_val = array();
	$tot_rcv_data = $this->db->query("SELECT a.date, ai.adjustment_id, ai.product_id, ai.quantity, (p.price*ai.quantity) AS p_val, p.price, ai.type FROM sma_adjustments AS a INNER JOIN sma_adjustment_items AS ai ON ai.adjustment_id=a.id INNER JOIN sma_products AS p ON p.id=ai.product_id WHERE ai.product_id IN(SELECT DISTINCT id FROM sma_products) AND a.date BETWEEN '{$start_date}' AND '{$end_date}'")->result();
	foreach($tot_rcv_data as $tot_rcv_v) {
		$tot_rcv_val[] = $tot_rcv_v->p_val;
	}
	$tot_rcv_val = array_sum($tot_rcv_val);
	$tot_pro_val = array();
	$total_products = $this->db->query("SELECT p.id, p.name, p.quantity, p.price, (p.price*p.quantity) AS tot_pro_val FROM sma_products AS p")->result();
	foreach($total_products as $pro_val) {
		$tot_pro_val[] = $pro_val->tot_pro_val;
	}
	$tot_pro_val = array_sum($tot_pro_val);
	$tot_cur_rcv_val = array();
	$tot_cur_rcv_data = $this->db->query("SELECT a.date, ai.adjustment_id, ai.product_id, ai.quantity, (p.price*ai.quantity) AS p_val, p.price, ai.type FROM sma_adjustments AS a INNER JOIN sma_adjustment_items AS ai ON ai.adjustment_id=a.id INNER JOIN sma_products AS p ON p.id=ai.product_id WHERE ai.product_id IN(SELECT DISTINCT id FROM sma_products) AND a.date BETWEEN '{$start_date}' AND '{$cus_end}'")->result();
	foreach($tot_cur_rcv_data as $tot_cur_rcv_v) {
		$tot_cur_rcv_val[] = $tot_cur_rcv_v->p_val;
	}
	$tot_cur_rcv_val = array_sum($tot_cur_rcv_val);
	$tot_sale_val = array();
	$total_sale_data = $this->db->query("SELECT si.*, p.name, p.category_id, c.id AS cat_id, c.code, c.name, SUM(si.subtotal) AS sub_total, SUM(si.unit_quantity) AS qty, SUM(si.item_discount) AS tot_discount FROM sma_sales AS s INNER JOIN sma_sale_items AS si ON s.id=si.sale_id INNER JOIN sma_products AS p ON si.product_id=p.id INNER JOIN sma_categories AS c ON p.category_id=c.id WHERE s.date BETWEEN '{$start_date}' AND '{$cus_end}' GROUP BY c.id ORDER BY c.code")->result();
	foreach($total_sale_data as $val_sale) {
		$tot_sale_val[] = $val_sale->sub_total;
	}
	$tot_sale_val = array_sum($tot_sale_val);

	$open_stock_val = ($tot_pro_val - $tot_cur_rcv_val) + $tot_sale_val;

?>

<div class="row">
	<div class="col-md-12">
		<h2 style="text-align: center;background-color: #fff;padding: 10px;margin-bottom: 30px">B+ Daily Report (<?php echo date("Y-m-d"); ?>)</h2>
	</div>
</div>


<!-- first table cat sale details -->
<div class="row">
	<div class="col-md-12">
		<table class="table table-striped table-bordered table-condensed table-hover dfTable reports-table">
			<tr>
				<th>Memo No</th>
				<th>Description</th>
				<th>Qnty</th>
				<th>Amount</th>
				<th>Discount</th>
			</tr>
			<?php $i=1; $x=array();$y=array();$z=array(); foreach($cat_sale as $cat_val) : $x[]=$cat_val->qty;$y[]=$cat_val->sub_total;$z[]=$cat_val->tot_discount; ?>
				<tr>
					<td><?php echo $i; ?></td>
					<td><?php echo $cat_val->code ?></td>
					<td><?php echo number_format($cat_val->qty, 0) ?></td>
					<td><?php echo $cat_val->sub_total ?></td>
					<td><?php echo $cat_val->tot_discount ?></td>
				</tr>
			<?php $i++; endforeach; ?>
			<tr>
				<td><b>Total:</b></td>
				<td></td>
				<td><b><?php echo array_sum($x); ?></b></td>
				<td><b><?php echo array_sum($y); ?></b></td>
				<td><b><?php echo array_sum($z); ?></b></td>
			</tr>
		</table>
	</div>
</div>
<!-- end first table cat sale details -->



<!-- second table -->
<div class="row">
	<div class="col-md-12">
		<table class="table table-striped table-bordered table-condensed table-hover dfTable reports-table">
			<tr>
				<th>Item</th>
				<?php foreach($stock_report as $stock_val) : ?>
					<th><?php echo $stock_val->name ?></th>
				<?php endforeach; ?>
				<th>Total</th>
				<th>Total Amount</th>
			</tr>
			<!-- 2nd table opening stock data -->
			<?php if($month == "Feb") : ?>
				<tr>
					<td>Open Stock</td>
					<?php for($i=0; $i<count($stock_report); $i++) : ?>
						<td>0</td>
					<?php endfor; ?>
					<td>0</td>
				</tr>
			<?php else: ?>
				<tr>
					<td>Open Stock</td>
					<?php $os=array(); foreach($custom_stock_report as $stock_val) : $os[]=$stock_val->QB; ?>
						<td><?php echo number_format($stock_val->QB, 0) ?></td>
					<?php endforeach; ?>
					<td><?php echo array_sum($os); ?></td>
					<td><?php echo $open_stock_val; ?></td>
				</tr>
			<?php endif; ?>
			<!-- end 2nd table opening stock data -->

			<!-- 2nd table receive data -->
			<tr>
				<td>Receive</td>
				<?php
					// $all_stock_balance = array();
					$rcv = array();
					foreach($stock_report as $stock_val) {
						echo "<td>";
						foreach($receive_data as $receive_val) {
							if($stock_val->code==$receive_val->cat_name) {
								// $stock_balance = $stock_val->QB + $receive_val->qty;
								// $all_stock_balance[] = $stock_balance;
								$rcv[] = $receive_val->adj_qty;
								echo number_format($receive_val->adj_qty, 0);
							}
						}
						echo "</td>";
					}
				?>
				<td><?php $receive_total=array_sum($rcv); echo array_sum($rcv);  ?></td>
				<td><?php echo $tot_rcv_val; ?></td>
			</tr>
			<!-- end 2nd table receive data -->



			<!-- 2nd table total data -->
			<?php if($month == "Feb") : ?>
				<tr>
					<td>Total</td>
					<?php
						// $all_stock_balance = array();
						$rcv = array();
						foreach($stock_report as $stock_val) {
							echo "<td>";
							foreach($receive_data as $receive_val) {
								if($stock_val->code==$receive_val->cat_name) {
									// $stock_balance = $stock_val->QB + $receive_val->qty;
									// $all_stock_balance[] = $stock_balance;
									$rcv[] = $receive_val->adj_qty;
									echo number_format($receive_val->adj_qty, 0);
								}
							}
							echo "</td>";
						}
					?>
					<td><?php echo array_sum($rcv); ?></td>
				</tr>
			<?php else: ?>
				<tr>
					<td>Total</td>
					<?php

						$all_stock_balance = array();
						$rcv = array();
						foreach($custom_stock_report as $stock_val) {
							echo "<td>";
							foreach($receive_data as $receive_val) {
								if($stock_val->code==$receive_val->cat_name) {
									$stock_balance = $stock_val->QB + $receive_val->adj_qty;
									$all_stock_balance[] = $stock_balance;
									echo number_format($stock_balance, 0);
								}
							}
							echo "</td>";
						}
					?>
					<td><?php echo array_sum($os)+$receive_total; ?></td>
					<td><?php $total_amount_data = $open_stock_val + $tot_rcv_val; echo $total_amount_data; ?></td>
				</tr>
			<?php endif; ?>
			<!-- end 2nd table total data -->



			<!-- 2nd table sale data -->
			<tr>
				<td>Sale</td>
				<?php
					$tot_sale = array();
					foreach($stock_report as $stock_val) {
						echo "<td>";
						foreach($cat_sale as $cat_val) {
							if($stock_val->code==$cat_val->code) {
								$tot_sale[] = $cat_val->qty;
								echo number_format($cat_val->qty, 0);
								continue;
							}
						}
						echo "</td>";
					}
				?>
				<td><?php echo array_sum($tot_sale); ?></td>
				<td><?php echo array_sum($y); ?></td>
			</tr>
			<!-- end 2nd table sale data -->

			<!-- data reserve from march -->
			<!-- 2nd table stock data -->
			<?php if($month == "Feb") : ?>
				<tr>
					<td>Balance Stock</td>
						<?php
							foreach($receive_data as $rcv_val) {
								echo "<td>";
								foreach($cat_sale as $cat_val) {
									if($rcv_val->cat_name==$cat_val->code) {
										$bal_data = $rcv_val->adj_qty-$cat_val->qty;
										echo number_format($bal_data, 0);
										continue;
									}
								}
								echo "</td>";
							}
						?>

					<td><?php echo (array_sum($rcv)-array_sum($tot_sale)); ?></td>
				</tr>
			<?php else: ?>
			<?php
			        foreach($custom_stock_report as $cs) {
			            foreach($cat_sale as $cat_data) {
			                if($cs->code == $cat_data->code) {
			                    $cs->QB -= $cat_data->qty;
			                }
			            }
			        }
			        foreach($custom_stock_report as $cs) {
			            foreach($receive_data as $rcv_data) {
			                if($cs->code == $rcv_data->cat_name) {
			                    $cs->QB += $rcv_data->adj_qty;
			                }
			            }
			        }
			?>
				<tr>
					<td>Balance Stock</td>
					<?php $os=array(); foreach($custom_stock_report as $stock_val) : $os[]=$stock_val->QB; ?>
						<td><?php echo number_format($stock_val->QB, 0) ?></td>
					<?php endforeach; ?>
					<td><?php echo array_sum($os); ?></td>
					<td><?php $total_balance_stock = ($total_amount_data - array_sum($y)); echo $total_balance_stock; ?></td>
				</tr>

			<?php endif; ?>
			<!-- end 2nd table balance stock -->
		</table>
	</div>
</div>
<!-- end second table -->

<div class="row">
	<!-- 3rd table -->
	<div class="col-md-6">
		<table class="table table-striped table-bordered table-condensed table-hover dfTable reports-table">
			<tr>
				<th>Expenditure Category</th>
				<th>Expenditure AMount</th>
			</tr>
			<?php $all_exp=array();foreach($expense_data as $expense_val) : $all_exp[]=$expense_val->cat_amount; ?>
				<tr>
					<td><?php echo $expense_val->name; ?></td>
					<td><?php echo $expense_val->cat_amount; ?></td>
				</tr>
			<?php endforeach; ?>
			<tr>
				<td><b>Total</b></td>
				<td><b><?php echo array_sum($all_exp); ?></b></td>
			</tr>
		</table>
	</div>
	<!-- end 3rd table -->

	<!-- 4th table -->
	<div class="col-md-6">
		<table class="table table-striped table-bordered table-condensed table-hover dfTable reports-table">
			<tr>
				<td>Total Expenditure</td>
				<td><?php echo array_sum($all_exp); ?></td>
			</tr>
			<tr>
				<td>Total Sale</td>
				<td><?php echo array_sum($y); ?></td>
			</tr>
			<tr>
				<td>Previous Cash</td>
				<td><?php echo number_format($prev_cash, 0); ?></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>Total Cash</td>
				<td><?php $tot_cash=(array_sum($y)+$prev_cash); echo $tot_cash;  ?></td>
			</tr>
			<tr>
				<td>Expenditure</td>
				<td><?php echo array_sum($all_exp); ?></td>
			</tr>
			<tr>
				<td>Running Cash</td>
				<td>
					<?php
						$running_cash = ($tot_cash-array_sum($all_exp));
						echo $running_cash;
					?>
				</td>
			</tr>
			<tr>
				<td>Total VAT</td>
				<td><?php echo number_format($total_vat, 0) ?></td>
			</tr>
			<!-- <tr>
				<td>Bilasi Tex Balance</td>
				<td><?php //echo ($total_balance_stock + $running_cash); ?></td>
			</tr> -->
		</table>
	</div>
	<!-- end 4th table -->
</div>