
<?php
session_set_cookie_params(0);
session_start();
include('includes/config.php');

include('includes/config1.php');
if (strlen($_SESSION['alogin']) == 0) {
    header('location: login.php');
} else {   
    if (isset($_REQUEST['del'])) {
    $delid = intval($_GET['del']);
    $sql = "DELETE FROM savings WHERE id=:delid";
    $query = $dbh->prepare($sql);
    $query->bindParam(':delid', $delid, PDO::PARAM_STR);
    $query->execute();
    echo "<script>alert('Savings Deleted');document.location = 'active-savings.php';</script>";
    }
    
    
    
    ?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>SMS</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>


        
        
        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
              rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
    </head>

</head>
<body class="sb-nav-fixed">
    <div id="layoutSidenav">

    <?php include('includes/header.php');?>

<?php include('includes/sidebar.php');?>

<div id="layoutSidenav_content" id="content-wrapper">
                <main>
                    <div class="container-fluid px-4">
                                               <div class="card mb-4">
                            <div class="card-header">
                               
                            <a href="#" id="create_new" align="right" class="btn btn-sm btn-primary">Active Savings</a>
                            
                            </div>
                              <div class="card-body">
                              <table id="dataTable" class="table table-bordered"   width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Amount</th>
                                            <th>REFNO</th>
                                            <th>Savings Date</th>
                                            <th>Approve</th>
                                                                                      
                                        </tr>
                                   
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        <th>ID</th>
                                            <th>Name</th>
                                            <th>Amount</th>
                                            <th>REFNO</th>
                                            <th>Savings Date</th>
                                            <th>Approve</th>                                           
                                        </tr>
                                       
                                    </tfoot>
                                    <tbody>
                                    <?php
                                    
                                    $sql = "SELECT savings.*,users.fname,users.lname from savings inner join users on users.id=savings.userid where savings.`status`=0";
                                       
                                        $query = $dbh->prepare($sql);
                                        $query->execute();
                                        $results = $query->fetchAll(PDO::FETCH_OBJ);
                                        $cnt = 1;
                                        if ($query->rowCount() > 0) {
                                            foreach ($results as $result) {
                                             ?>
										
                                        <tr>
                                        <td><?php echo htmlentities($cnt); ?></td>
                                    
                                    <td><?php echo htmlentities($result->fname); ?> <?php echo htmlentities($result->lname); ?></td>
                                    
                                    <td><?php echo htmlentities($result->amount); ?></td>
                                    <td><?php echo htmlentities($result->refno); ?></td>
                                    <td><?php echo htmlentities($result->pay_date); ?></td>
                                   
                                    
	<td>
	<a href="edit-savings.php?id=<?php echo $result->id;?>"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;
<a href="active-savings.php?del=<?php echo $result->id;?>" class="delete" title="Delete" data-toggle="tooltip" onclick="return confirm('Do you want to delete?');"><i class="fa fa-close"></i></a></td>
                                        </tr>

                                        <?php $cnt = $cnt + 1;
                                            }
                                        } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>


            </div>
        </div>
        
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
<?php } ?>