<div class="row">
	<div class="col-md-12">
		<h2 style="text-align: center;background-color: #fff;padding: 10px;margin-bottom: 30px">B+ Daily Report (<?php echo date("Y-m-d"); ?>)</h2>
	</div>
</div>

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

<div class="row">
	<div class="col-md-12">
		<table class="table table-striped table-bordered table-condensed table-hover dfTable reports-table">
			<tr>
				<th>Item</th>
				<?php foreach($stock_report as $stock_val) : ?>
					<th><?php echo $stock_val->name ?></th>
				<?php endforeach; ?>
				<th>Total</th>
				<!-- <th>Total Amount</th> -->
			</tr>
			<tr>
				<td>Open Stock</td>
				<?php $os=array(); foreach($custom_stock_report as $stock_val) : $os[]=$stock_val->QB; ?>
					<td><?php echo number_format($stock_val->QB, 0) ?></td>
				<?php endforeach; ?>
				<td><?php echo array_sum($os); ?></td>
				<!-- <td><?php //echo $stock_amount; ?></td> -->
			</tr>

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
				<td><?php echo array_sum($rcv); ?></td>
				<!-- <td></td> -->
			</tr>
			<tr>
				<td>Total</td>
				<?php for($i=0; $i<count($stock_report); $i++) : ?>
					<td></td>
				<?php endfor; ?>
				<td></td>
				<!-- <td></td> -->
			</tr>
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
				<!-- <td><?php //echo array_sum($y); ?></td> -->
			</tr>
			<tr>
				<td>Balance Stock</td>
				<?php $os=array(); foreach($stock_report as $stock_val) : $os[]=$stock_val->QB; ?>
					<td><?php echo number_format($stock_val->QB, 0) ?></td>
				<?php endforeach; ?>
				<td><?php echo array_sum($os); ?></td>
				<!-- <td><?php //echo $stock_amount; ?></td> -->
			</tr>
		</table>
	</div>
</div>

<div class="row">
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
				<td><?php echo $tot_cash-array_sum($all_exp); ?></td>
			</tr>
			<tr>
				<td>Total VAT</td>
				<td><?php echo number_format($total_vat, 0) ?></td>
			</tr>
		</table>
	</div>
</div>