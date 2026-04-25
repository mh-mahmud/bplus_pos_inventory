<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-users"></i>List Tables</h2>


    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                <p class="introtext"><?= lang('list_results'); ?></p>

                <div class="table-responsive">
                    <table id="" cellpadding="0" cellspacing="0" border="0"
                           class="table table-bordered table-condensed table-hover table-striped">
                        <thead>
                        <tr class="primary">
                            <th>ID</th>
                            <th>Table Name</th>
                            <th>Table Description</th>
                            <th style=""><?= lang("actions"); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach($get_record as $val) : ?>
                            <tr>
                                <td><?= $val->table_id ?></td>
                                <td><?= $val->table_name ?></td>
                                <td><?= $val->table_desc ?></td>
                                <td>
                                    <!-- <a class="btn btn-success btn-xs" href="<?php //echo base_url() ?>billers/table_list/edit/<?php echo $val->table_id; ?>">Edit</a> -->
                                    <a class="btn btn-danger btn-xs" href="<?php echo base_url() ?>billers/table_delete/<?php echo $val->table_id; ?>">Delete</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                        </tbody>
                        <!-- <tfoot class="dtFilter">
                        <tr class="active">
                            <th>a</th>
                            <th>a</th>
                            <th>a</th>
                            <th style="width:85px;" class="text-center"><?= lang("actions"); ?></th>
                        </tr>
                        </tfoot> -->
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<?php if ($Owner || $GP['bulk_actions']) { ?>
    <div style="display: none;">
        <input type="hidden" name="form_action" value="" id="form_action"/>
        <?= form_submit('performAction', 'performAction', 'id="action-form-submit"') ?>
    </div>
    <?= form_close() ?>
<?php } ?>
<?php if ($action && $action == 'add') {
    echo '<script>$(document).ready(function(){$("#add").trigger("click");});</script>';
}
?>
    

