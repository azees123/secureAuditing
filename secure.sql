-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2024 at 08:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `secure`
--

-- --------------------------------------------------------

--
-- Table structure for table `cloudprovider`
--

CREATE TABLE `cloudprovider` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cloudprovider`
--

INSERT INTO `cloudprovider` (`id`, `email`, `password`) VALUES
(1, 'cloudprovider@gmail.com', 'cloudprovider');

-- --------------------------------------------------------

--
-- Table structure for table `data_owner`
--

CREATE TABLE `data_owner` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_owner`
--

INSERT INTO `data_owner` (`id`, `full_name`, `email`, `password`, `phone`, `address`) VALUES
(1, 'azee', 'azee@gmail.com', 'azee', '1111111111', 'Plat no 41 G1 School street'),
(2, 'abu', 'abu@gmail.com', 'abu', '1232123212', 'Plat no 41 G1');

-- --------------------------------------------------------

--
-- Table structure for table `data_user`
--

CREATE TABLE `data_user` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_user`
--

INSERT INTO `data_user` (`id`, `full_name`, `email`, `password`, `phone`, `address`) VALUES
(1, 'prakash', 'prakash@gmail.com', 'prakash', '1232123212', 'No.2 pdkt'),
(2, 'bahur', 'bahur@gmail.com', 'bahur', '1323124331', 'No.2 annavasal');

-- --------------------------------------------------------

--
-- Table structure for table `fileupload`
--

CREATE TABLE `fileupload` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_data` longblob NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `decrypt_key` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `query` varchar(255) NOT NULL,
  `status` enum('pending','accepted','rejected','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fileupload`
--

INSERT INTO `fileupload` (`id`, `file_name`, `file_data`, `full_name`, `decrypt_key`, `uploaded_at`, `query`, `status`) VALUES
(2, 'Food Wastage Abstract.docx', 0x504b03041400060008000000210032916f5766010000a5050000130008025b436f6e74656e745f54797065735d2e786d6c20a2040228a000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b494cb6ac3301045f785fe83d1b6d84aba28a5c4c9a28f651b68fa018a344e44f542a3bcfebee33831a5243134c9c620cfdc7bcf083183d1da9a6c0911b57725eb173d9681935e69372bd9d7e42d7f641926e19430de41c936806c34bcbd194c36013023b5c392cd530a4f9ca39c831558f8008e2a958f56243ac6190f427e8b19f0fb5eef814bef12b894a7da830d072f50898549d9eb9a7e3724110cb2ecb969acb34a2642305a8a4475be74ea4f4abe4b2848b9edc1b90e78470d8c1f4ca82bc70376ba0fba9aa815646311d3bbb0d4c5573e2aaebc5c585216a76d0e70faaad2125a7ded16a2978048776e4dd156acd06ecf7f94c32dec1422292f0fd25a774260da18c0cb1334beddf1901209ae01b073ee4458c1f4f36a14bfcc3b412aca9d88a981cb63b4d69d1089d60034dffed91c5b9b5391d4398e3e20ad95f88fb1f77ba356e734708098f4e957d72692f5d9f341bd9214a803d97cbb64873f000000ffff0300504b0304140006000800000021001e911ab7ef0000004e0200000b0008025f72656c732f2e72656c7320a2040228a000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ac92c16ac3300c40ef83fd83d1bd51dac118a34e2f63d0db18d907085b494c13dbd86ad7fefd3cd8d8025de96147cbd2d393d07a739c4675e0945df01a96550d8abd09d6f95ec35bfbbc78009585bca53178d670e20c9be6f666fdca234929ca838b59158acf1a0691f88898cdc013e52a44f6e5a70b692229cfd46324b3a39e7155d7f7987e33a09931d5d66a485b7b07aa3d45be861dbace197e0a663fb197332d908fc2deb25dc454ea93b8328d6a29f52c1a6c302f259c9162ac0a1af0bcd1ea7aa3bfa7c589852c09a109892ffb7c665c125afee78ae6193f36ef2159b45fe16f1b9c5d41f3010000ffff0300504b030414000600080000002100b3be8b1d05010000b60300001c000801776f72642f5f72656c732f646f63756d656e742e786d6c2e72656c7320a2040128a0000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ac93cd6ac3301084ef85be83d87b2d3b6d4309917329815c5bf701647bfd43f563a44d5abf7d454a128706d3838e336267be85d57af3ad153ba0f3bd3502b2240586a6b2756f5a011fc5f6e1059827696aa9ac4101237ad8e4f777eb375492c290effac1b39062bc808e685871eeab0eb5f4891dd08497c63a2d2948d7f241569fb245be48d32577d30cc8af32d9ae16e076f523b0621cf03fd9b669fa0a5f6db5d768e84605f7481436f32153ba1649c0c9494216f0db088ba808342a9c021cf55c7d16b3deec75892e6c7c21385b7310cb98101466f1027094bf6636c7f01c93a1b1860a59aa09c7d99a83788a09f185e5fb9f939c9827107ef5dbf21f000000ffff0300504b030414000600080000002100711cae0bf70e0000bdcb000011000000776f72642f646f63756d656e742e786d6cec5ddb72dbb819beef4cdf01a39beecec8b20e969c68d6de5164277127deb8767633bdea402424614d125c0094a2bdea43f409fb24fd7f80d4d996145912e522173145822080effb0fc08fc34f3f7f0b0332605271115d142aa57281b0c8133e8f7a17855fbfbc3f7953204ad3c8a78188d84561c454e1e7cbbffee5a761d3175e12b24813c82252cd61ec5d14fa5ac7cdd353e5f559485529e49e144a7475c913e1a9e876b9c74e8742faa7d572a56cae62293ca6147caf4da301558534bb70313711b3081e76850ca9869fb2771a52f998c427907b4c35eff080eb11e45d6e64d9888b4222a3669ac5c9b840f84ad31628fd93bd21d7f9ae7de52a6d01f3c553c902288388549fc7936a7c6f6ef0b09f653278ae128330c8d20de3cad976185c493a843f930cd729be6f5f0a035bf2e773ac94d74004b318bfb14e1166bf999524a43c9a7cf8bb9a66aa712bf5cd32a8ce6710f7b603e78314493cc98d6f97db4df438ce0b257b83bc5290a7aba6b62bcc439fc62081a1d7bce94542d24e002502c808b43a415a172e41e374843fc2bf3119364163f9f7178572f95dbddea85c17b25b77d2dcbc2ed75aadf1cd2bd6a549a0179fdc4ddd3239df49fcf3bb07cf0734b8287820904c164ef1aeb40fe57b11690509a8f23880f085874c915fd890dc8b90469875bf15a9e54f3cb578db64aefecc3e79d6c8eeb4f12b53f74ed3329c8e0b6affcb4bb9864d630c9a2aa61ee0174ba6981cb0c2658bbc17c2275f2998921e23f7cc4f3c5495045fd536035385a528e6ad8e97ad380eb86794fd4c051097457e6e47459a68f180ed79759d15a86ccb3879f2cbfc13fff744e97bdeebeb9bc89f7b88e080c4611b7681da781fae038e3aa07a36fe719fa008e237ec6b1391e808b04cfb14886a7d1194caf9130271180675ecff6d65fe72fb7ffa6b938a1876759496d4d3f9908dd99a6d5897e5dae0bffffe4fee047f8beaa0564381eaa28ae38a5002062f04e506e60dec58487844442289121e677a54b2ba70086f310225018568bc6878d39389c76940c0227a8c704d3c1a111e423e0366b260d1804b11617a48065e39619e8804985aa240e2c1dda1d6072e91af8cf429bcc67d48ccbb9cf944f7194914e4d425a180748c68e6f5231188de88684124aa6566ebb1503cfc5827e1015ee10f29b89f654327fa103e4221491088a17a126484f8eabad1ba6e1f09c43cf2f980fb09343a34a02442be2602c385a689a4583ea0812f220ad823e0aa4f2543de706968a1ccdd8075b5c03e231972dd273113319000581e31e697c8973e0a410c4690070150169d39d36c2677c97a1ca8258b0468c7a3221970a812d72c5445427d7fe1125ff2a8d4457835444140998007a42b4568386d9f9a92891ec8899e2a03fc49d0c134099fe363a552ab5ebd3912c4d41fc17112f05269f0ee7b965d92d1e04443aec4a79a76a86225d28a4656c4523a1915a81843956230b45a36843c54ca54d04b23e2f36e97495454966998bfa510f207d90032db877c912ca5d55edbf9db6aa57db5cc6b9b7de2bcb6edbdb6a5009c351aedb7efc6005856b7abb576bdbe0c95d9e40e95654edc8b78d42904392c328af4f5376e9db18711189970b59ccfd1cc31eac072fe3c00e92d07c00b09f3547be6ca4bb8a5e006ccb8a50c80d262dee7c95bc1977b6b2b5cb5bc82a0fb520c8dcf9539fcd6f982fe1dde4444a02789973e1d113660d8f91349af8ff71c527b442a1b798899ec324f0723d20515858e6f0770021719ba59c33ef7fa24643452b68fde4f7a0ea57da244439160314068ac1c41d7da0cb3409ff96bdf8ca3983e0e609301da61608a1c487b04c90252246aaef81d211e31d8fca0a1ff08af733ff50c221a42bdfff541bca3dea3fd4296f6da381736a575088ea30d04f4c8bb34e40187bcb0ffdd01aa8252a1ddae903e0e6b82a2415512283b026406881c4df70851c0438e231fa188d80887bbd8084743fea6498f6930cdc60c478996dc0ccafa89b106c696034d1d5487ae0bd8803e1dd87149c9582a4c3c22149da9d26c554f5dbfe95806a81c2afb43e56894356867c9c07432f0c2a1b3c43cee63344e104fa273eeb4f13e7d9b44ce862b0501017834a67132e030766b481201703ac13883c3698f38d9a022f8e102ac22b8e4341d6c900267138e2341c579906cd0b1e3c0da275826c20b921473ef11236e493c09ce4e09d5d281a3927375f200e3b3aece5c3074552c6ef6898b9ccca2d2f96e6c16f441ae6371cb35dc9d14b150e0fed800dd1a1d9df36aad61e19be7d9ec13c3b3f496e3d94b4aff2c00967a0e95fda1b220f753ed992b3fe0d64c077c95ae575e9b7ca62f3399cd69620711eb72339f14bce3a9599d0e9f3de2138e67d09a515a332791723bab1117da2566365c87699d86571d3a0742e773224d68c378274a04899129d51749805315c753a31d407b04081596119011e982810fb8a693b9f6383b197ff088e0046d3bef3e89b8c629a4af35709a5b519a5f51904ec21e0af968564520485c9be50d9ac5a0ff8654faf3615687d12e31f299e2bd084586662647d96ed864f5874f39ce1f197b0b257213916ea213c98a0eac3d82a5b3250c9eb140389327ead3c833515f695422f5719d7e3a188a4b6e8e57e91d29485d4651325473a6f8a73b18c7881ff408f46b5a924f5ce93b0abea3a471da6d8d92d0a6e4c120c8d2a5bd63787633ee3157d24a8c5f709df1d7d819bffe869366118634e66516c2e092c01067d7ea51cccc5c34b3880693d985338c6b5c2663c6ef85ecd188ff6977b5202af1fa84aae979b9455c5543ed64a191bd46c72b5defe564c2c944be64a23531988148474db28e8559029b8a8ab29df519d1c8ba822a661eef8e663349e35966bda46fbca79263bf637f6ed9af213fb346d2c79839b097513b3b3cc838dcb1eb30673b68ebd0f83be203ed5ab55c99890e3a6e3b6e6fc4ed5bfa98711b5d1d95c4b19050ac1058c771797a1c508d3b4629f203ee4ba4b2dff3fd8ebcd5ecb5452b7edc87427101c7ada47e292a73fb185954b6dcdc684f35b7b5fc7fa9f95a756ad4cbb5b74bf737489fec1fa5ead91316e8606518363ba858b1ab0cca97f658f67013a29c9f9d5fd5dee753443aeb42b0b44a072e1e28580aea99453e0387f50ee07927197d34efe8cb07d1d5435c6277cffe48b834413ed52427abcdcf918bfb025afbd90a66daccbf97903fb98efc26f9f8e5f653bd48da0f0fb522792784c6bdcd6207c2ee41c0f5881683bb8f774572fbcf877f7cdab8dd5d133fd7c46dc85e8ac0b6722bea250195e4ef7440c98327793cbb83dfd2e69e330eab683e9b3ca7aec5d23a3d6d0597d469cabee48057fbb176d3bc6aa5dbeb7d1122582bb4e45a7cbb167f2a2849c8cdd57573bcdde1834e7c3ebb0989c363bf7864a2711d82b2d5629d1893036357607ca3611c9f0c7954ab9ed44bf552e5ed49f9e4b776a5e250d9392a143b47ae81776885c16d5edb026fe4b2397db2737d926300d697d676f5acd15a3ee47de03ad9a19995d44a2bb0d7c220513e52e92f8efd38a3b473d1c6e57d78a2879028ce33ff9ae84c479a05a4e680d83d103791d2340870b2280b851c911fee5bb73f66409c910fef1c0abb47011511b9e2ea71a938d4cbe5b570c8af1dc861937f8e99b493b6d215c6334dfe95473e9e4c705e7c53ac94c909699c910e5f63a0ee690ca68cdc411a7c6f6dbb592c6caec12c1dae2ab53a9ecdf6642b4e3379b1612731771b67af359e8cb3efdcdf98894bbdb1f7a7e3cbf6de225ecb3612ace0d7d28d04bf08aff1a6566b34c619acd9b62b19fafadb764ef9ecd3fddcacc8264069d5d3adf0a179d7f14e3794a87abb5ea9b457a0fe72f3ecb2d0ecf8054d3b2afd9ba5c17d84b140b180a67c5b4eb37932c15b9300db25cd2a371ccdce795a3c156913b6e6ba9c4f76d47fc5b9d0336c9d12bc553ccd7b952fefd3e3695e5c1cd752c24e1c0f288ec749d84f788a9263ab63eb31b075b945f90d4f007bcea2a4aecc71d6ce9cf6f75ced6a57f5b7bbef236faf696ed63a50c7291aa768f22a8a2dff79497cbd7ae6b87c9a9bc54daaa6613a1685b9b9b69c528c6925d3274e31baeefb0b75df635cf2797ac502a6993d8af839593be6cefc3a4be7964ae5ecd0d98a41b529a3e1a4d249e52a52a602483e0881fb64f49818ef22b03131bf6308d8b1d5b1756b15fac0a8f4faf0292a71633e73589939aa7b6387c7750f5df73057dd431ce450e48b206d0ccf6ecc67475d47dd1dfb0ff72c1403465a91e12a792f4568362b42c2aee6eb6cb7d275389db3b06bad6a46f7f143e4b3f4e743c78ea38ea3fb559f868eb7234bc6d55cacb6cf6aedb3311757f9abb3c91d411d415f46890261efa4e8e20edb1bfba4ae8fe51cd503cd4c219f93cde756db5a3ebda26e2dbeeeb065e6013a900c7e6414b773aca650cc6f4736b507d9e1f8ef8940207b4d8127df3c2a3178813aa000d879bee48a29b335c8fc70ef70c9a9f1d9d695c7a6e16bf31a7eaf9bef1d8aeb4745ea8d8316666ff0639c1c6b84e858087ac8dd215f1f69cdf933a1d5bb7095e0c14ee353b709b5bb7a4bc3695c32867bdce38eb025d242ccd227cc1c31347dcc1aa6b1c70e1ba1c80ebf6511bec4233c07d7ae822de13872964b7a4a07bc3a3eaa83f84c531ea86c67f10e233d3e6011eebd9ce56f0f38ce12ea3ed553a9a13f802b3ca792633de19a4b1243d9444483f1bbb8dbb33d90d7ac89f6c70fd2d7158386d124a64a0d85f48be3b06411cf19819e88224c7ba563ef7e38e3f4eae47cab29f0d78dd6f5d2a91e4b789926de9a974765931c2fb7719a884723d0a440507b269dd1d2b8d4d3e8e34cd93aa5eac89b2bf23eb7b3ae1941377172d70f70b4cd99ce4da7268d0fe6197265552d0eafa43e78365dc9695d47df7cd177d5bc24a7701d6373a670dbd9684a04f98c752be85ddd1f8f30882ef923a191e67ab46c58c1837a50ef7b03454e1d3b72ef5d1df3109c62a78f1d65f346d969766af19cc37b2c355ab5d1f14124ccc9c91372e2ecb65382b9ef467df7f20e67be1d730fc4dcf141a653cbed30988d3cee0a69c6b710a99c72da31d3194ca77672db6bd86e5199b3928eae87b792e99626c7691f572d82a89e1bae61e1375fe3c00d6331bf8bc2593d25ed51cc35cc0052ccd3776372ae42c9b478ef01bf37049d504de7c2f7e1bafee62cad7fdcbba598a31631dc3f4b4f1047019ffc8496d1229cfcb64d98fdea33eaa3b49f57cd4f209e11fef4672fd1a92e309ff34480754d598b69cc6d5f781f2437f00070775c7b7d0ba56d0c5b6f73d911fec85cc02b099e6872f93f000000ffff0300504b030414000600080000002100aa5225df230600008b1a000015000000776f72642f7468656d652f7468656d65312e786d6cec594d8b1b3718be17fa1fc4dc1d7fcdf8638937d8633b69b39b84ec26254779469e51ac191949de5d13022539160aa569e9a181de7a286d0309f492fe9a6d53da14f217aad1786cc99659da6c602959c35a1fcffbead1fb4a8f349ecb574e12028e10e398a61da77aa9e200940634c469d471ee1c0e4b2d077001d310129aa28e3347dcb9b2fbe10797e18e88518280b44ff90eec38b110d39d729907b219f24b748a52d937a62c81425659540e193c967e1352ae552a8d720271ea801426d2edcdf11807081c662e9dddc2f980c87fa9e0594340d841e61a19160a1b4eaad9179f739f30700449c791e384f4f8109d080710c885ece83815f5e794772f979746446cb1d5ec86ea6f61b73008273565c7a2d1d2d0753db7d15dfa570022367183e6a031682cfd29000c0239d39c8b8ef57aed5edf5b6035505eb4f8ee37fbf5aa81d7fcd737f05d2ffb187805ca8bee067e38f45731d44079d1b3c4a459f35d03af4079b1b1816f56ba7db769e0152826389d6ca02b5ea3ee17b35d42c6945cb3c2db9e3b6cd616f015aaacadaedc3e15dbd65a02ef53369400955c28700ac47c8ac63090381f123c6218ece128960b6f0a53ca6573a5561956eaf27ff67155494504ee20a859e74d01df68caf8001e303c151de763e9d5d1206f5efef8e6e57370fae8c5e9a35f4e1f3f3e7df4b3c5ea1a4c23ddeaf5f75ffcfdf453f0d7f3ef5e3ff9ca8ee73afef79f3efbedd72fed40a1035f7dfdec8f17cf5e7df3f99f3f3cb1c0bb0c8e74f8214e100737d031b84d133931cb0068c4fe9dc5610cb16ed14d230e5398d958d003111be81b7348a005d7436604ef32291336e0d5d97d83f041cc66025b80d7e3c400ee534a7a9459e7743d1b4b8fc22c8dec83b3998ebb0de1916d6c7f2dbf83d954ae776c73e9c7c8a0798bc894c308a54880ac8f4e10b298ddc3d888eb3e0e18e5742cc03d0c7a105b43728847c66a5a195dc389cccbdc4650e6db88cdfe5dd0a3c4e6be8f8e4ca4dc1590d85c226284f12a9c09985819c384e8c83d28621bc983390b8c807321331d2142c120449cdb6c6eb2b941f7ba94177bdaf7c93c31914ce0890db90729d5917d3af163984cad9c711aebd88ff8442e51086e51612541cd1d92d5651e60ba35dd773132d27df6debe2395d5be40b29e19b36d0944cdfd3827638894f3f29a9e27383d53dcd764dd7bb7b22e85f4d5b74fedba7b2105bdcbb07547adcbf836dcba78fb9485f8e26b771fced25b486e170bf4bd74bf97eeffbd746fdbcfe72fd82b8d5697f8e2aaaedc245befed634cc8819813b4c795ba7339bd70281b5545192d1f13a6b12c2e8633701183aa0c18159f60111fc4702a87a9aa1122be701d7130a55c9e0faad9ea3beb20b3649f86796bb55a3c994a032856edf27c29dae56924f2d64673f508b674af6a917a542e0864b6ff8684369849a26e21d12c1acf20a166762e2cda1616adccfd5616ea6b9115b9ff00cc7ed4f0dc9c915c6f90a030cb536e5f64f7dc33bd2d98e6b46b96e9b533aee793698384b6dc4c12da328c6188d69bcf39d7ed554a0d7a59283669345bef22d79988ac690349cd1a38967baeee4937019c769cb1bc19ca623295fe78a69b904469c709c422d0ff4559a68c8b3ee4710e535df9fc132c1003042772adeb6920e98a5bb5d6cce67841c9b52b172f72ea4b4f321a8f5120b6b4acaab22f7762ed7d4b7056a13349fa200e8fc188ccd86d2803e535ab590043ccc5329a2166dae25e45714dae165bd1f8c56cb5452199c67071a2e8629ec3557949479b8762ba3e2bb3be98cc28ca92f4d6a7eed9465987269a5b0e90ecd4b4ebc7bb3be435562bdd3758e5d2bdae75ed42ebb69d126f7f2068d4568319d432c6166aab5693da395e08b4e1964b73db1971dea7c1faaacd0e88e25ea96a1baf26e8e8be5cf97d795d9d11c1155574229f11fce247e55c09546ba12e2702cc18ee380f2a5ed7f56b9e5faab4bc41c9adbb9552cbebd64b5dcfab57075eb5d2efd51ecaa08838a97af9d843f93c43e68b372faa7de3ed4b525cb32f05342953750f2e2b63f5f6a55adbfef605601999078ddab05d6ff71aa576bd3b2cb9fd5eabd4f61bbd52bfe137fbc3beefb5dac3870e385260b75bf7ddc6a0556a547dbfe4362a19fd56bbd4746bb5aedbecb6066ef7e122d672e6c577115ec56bf71f000000ffff0300504b03041400060008000000210068272c5d09040000300b000011000000776f72642f73657474696e67732e786d6cb4565b6fdb36147e1fb0ff60e8798e757722d4296cd95e53c4eb50a53f8092689b08290a2465c71df6df77488991e36a85b7a24fa2ce776e3c57be7bffc2e8e8808524bc9a39de8deb8c7055f09254bb99f3e5693dbe754652a1aa44945778e69cb074dedffffacbbb6322b152c02647a0a292092b66ce5ea93a994c64b1c70cc91b5ee30ac02d170c29f815bb0943e2b9a9c705673552242794a8d3c477ddd8e9d4f099d3882ae9548c192904977cabb448c2b75b52e0ee6325c435765b91252f1a862b652c4e04a6e003afe49ed4d26a63ff571b807babe4f0bd4b1c18b57c47cfbde2ba472eca57896bdcd302b5e005961212c4a8759054bde1f01b45afb66fc0767745a30ac43dd79cce3d8ffe9b02ff4281a4d7dca4851e492e9068eba4bb062b92875dc505ca2954255c67041e39f750965f3967a363526351406ea0a643d79968604f4a9cd5985288c94a082ea42197788b1aaa9e509e295e83e401816b53bf932af648a0426191d5a800c994574a706af94afe07572954b380607712a6b6fb53d6f60948548881b36f6a7fc34b28e463d208727d3cb580b10e573e33796988435f0bb8f4930e52a64e14afc1f98c7cc5f3aafcd8484540a3e9801ff0e07b0ee04a5bfe04697d3ad5788d916a204c3fc998c9c49a927a4374721faa12d2ffd38c91ed160b304090c21b281f22f8d1c4f90346258cd31fb43b392f2318cea5b487cf9c2bcbeaba69e8adbcae5235da239e17f8cbdb21c44fc3200d87906019dd05eb21248ce3f46e3184440b370dfc41248d3c2f1d42e2c80dee9643c8d40f62dbaf1748385d0efb36bdf3bd7450dbddd28dd6d32164e147b7b6c32f90288abdd520b27283f97c0849fd208dba56bc44c2783e68e7df33b75cc5f39589dbe435f72cd1ebe54f614fba9147ac954811cb0541a38d5e4013cd918be705a92c9e6398a8f81cc99adc82e3710b4886285dc3a4b380718d252591f5126fcd996e90d8f57a3b0e314885a9faf155971ec458fc2e7853b7e851a0ba6d50cbe2856dda59422af54898a5cb26cfac54053be00c6aaaf2d3419838f5e139260a1acd0cba47641ad6f0e26afc25eb1a9a8a4c3723dea0ba6e7b3adf79338792dd5e79ba0d15fc95f04e313ff9ceef30df607e8b991f54e89b017777e869bea59df1059616f4b4d0d2c29e16595ad4d3624b8b356d0fd354c01a7b86f1628f9abee594f2232e3ff4f837a43608728f6abc6c371f94176f09dd2a94a343825f6075e2922878fed5a464e80572e4fab116efb8293af146bde1d59866aedf6a28914276b0bd1136257ee18bdec8058172cc4e2cef17ed4deb38251286710d3b597161b1df0ce6456659ab27a8e26748ec67bc5d2089cb0e2b79f150ea57422bf397bb0afc5b6fe98de7d3381d872b6f3e9ebb0b6f7cebcd176b981ceb7019fddd75a17deadeff030000ffff0300504b03041400060008000000210024efb64413010000ff01000014000000776f72642f77656253657474696e67732e786d6c94d15f4b03310c00f077c1ef70f47deb6da8c8b1db406422f80f74bef7badc566c9ad2749ef3d31bcf39115fe65bd3343f9266327b435fbc426247a156a361a90a0896962eac6ab5789a0fce55c1d984a5f114a0565b60359b1e1f4dbaaa83e6117296975c8812b8425bab75ceb1d29aed1ad0f090220449b694d06409d34aa3492f9b38b084d164d738eff2568fcbf24ced987488426deb2c5c92dd2084dcd7eb045e440abc7691bfb5ee10ada3b48c892c30cb3ce8bf3c342eec99d1c91f089d4dc4d4e6a10cb3eba8a7a47c54f627f43fc0e9ff80f11e405b5daf0225d3785981745208a6a6b2038ad9a17b8739a58b441d43d29fd7f211dbfbf07c7bd347c67bea1eeeae24d0bfd636fd000000ffff0300504b030414000600080000002100b0d9d3c3450c0000327500000f000000776f72642f7374796c65732e786d6ce49d4b77dbba11c7f73da7df8147ab7691d8f233f1b9ce3db693d43e7512dfc869d6100959b82609958fd8eea72f008212a921280e38f5a69bc422353f8098f90f307c88bffdfe9cc4c12f9ee542a6e793e9dbfd49c0d35046227d389ffcb8fffce6dd24c80b96462c96293f9fbcf07cf2fb87bffee5b7a7b3bc7889791e28409a9f25e1f9645914abb3bdbd3c5cf284e56fe58aa76ae74266092bd4c7ec612f61d963b97a13ca64c50a3117b1285ef60ef6f74f2616930da1c8c54284fca30ccb84a785b1dfcb78ac8832cd976295d7b4a721b4279945ab4c863ccfd5412771c54b9848d798e911002522cc642e17c55b7530b64706a5cca7fbe6af24de008e718083352009cf6e1e5299b179ac465ff52450b0c90735fc910c3ff2052be322d71fb3bbcc7eb49fcc7f9f655ae4c1d319cb4321ee55cb0a9208c5bbbe487331517b38cb8b8b5cb0ce9d4bfd47e79e302f1a9b2f4524267bbac5fc3f6ae72f169f4f0e0eea2d57ba07ad6d314b1fea6d3c7df363d6ec4963d35c71cf272c7b33bbd0867bf6c0aaff1b87bbdafe641a5eb1509876d8a2e02ab2a627fb1a1a0b1dc807c7efeb0fdf4b3db6ac2ca46dc400aaffd7d83d30e22ae054f8cd2a15a8bd7c712bc3471ecd0ab5e37c62da521b7fdcdc6542662ad2cf27ef4d9b6ae38c27e25a44114f1b5f4c9722e23f973cfd91f368b3fd8fcf265aed865096a9fafbf0746aa220cea34fcf215fe9d8577b53a67df2551bc4fadba5d8346eccff5dc3a6d6135df64bce740208a6db08d37d14e2405be48da3ed66965bc76ebe856ae8f0b51a3a7aad868e5faba193d76ae8f4b51a7af75a0d19ccffb2219146fcb912226c065077711c6a44731c6243731c5a42731c5241731c4a40731c818ee638e218cd7184298253c8d015858d603f74447b3f77f71ce1c7dd3d25f87177cf007edcdd09df8fbb3bbffb7177a7733feeeeecedc7dd9dacf1dc6aa915dc2899a5c568952da42c5259f0a0e0cfe3692c552c5315d1f0f4a4c733928324c05499cd4ec4a36921339f77478811a9ff7c5ee8422e908b60211eca4c15d3633bced35f3c56656dc0a248f10881192fcacc31223e319df105cf781a72cac0a683ea4a3048cb644e109b2bf640c6e269443c7c35912429ac035ad5cf4b2d124110d4090b3339be6b9291e5875b918f1f2b0d092ecb38e644acaf34216658e36b0383195f1a18ccf8cac060c617060d9f510d91a5118d94a5110d98a5118d5b159f54e3666944e3666944e36669e3c7ed5e14b149f1cd55c774f8b9bbab58eaf3d8a3fb31130f29530b80f1d38d3d671adcb18c3d646cb50cf459e96e6cf398b1ed5ccae825b8a798d3d624aa75bd09912b75d4222dc70f688b4625ae358f485e6b1e91c0d6bcf112fba296c97a81764d53cfccca79d1295a431a24da198bcb6a413b5e6dac181f611b017c16594e26836e2c41047fd5cb59ed4e8accb7e9e5f88e6d58e365b59d9548bb679104bd8c65f8489386af5f563c5365d9e368d26719c7f2894774c45991c92ad69a923f302e1924f94fc96ac972616aa51662f8545f5f010fbeb0d5e803ba8b994869fcf6e94dc2441cd0ad20aeefbfdc06f772a5cb4c3d3034c04b5914322163da33817ffbc9e77fa7e9e0852a82d317a2a3bd203a3d646057826092a948322222a965a64805c91c6a78ffe42f73c9b288867697f1eaa693821311672c59558b0e026da9bcf8a4f20fc16ac8f0fec532a1cf0b5189ea9e04d6386d9897f33f79383ed57d9501c999a16f6561ce3f9aa5aeb1a6c38d5f26b470e39708c69b6a7ad0f14b70b02ddcf8836de1a80ef62a66792e9c9750bd7954875bf3a88f777cf167793296d9a28ce906b006928d600d241b421997499a531eb1e1111eb0e1511f2f61c8181ec12939c3fb4726223267181895270c8cca0d0646e503032375c0f83b741ab0f1b7e93460e3efd5a960444b80068c2ace48a77fa2ab3c0d18559c1918559c1918559c1918559c1d7e0cf862a116c174534c034915730d24dd4493163c59c98c652f44c84f317f600427482bda5d2617fa6904995637711320f539ea9870b15de1a89cfc93cfc9baa65994fd223823cae2584aa2736b9b09c758b6ef5ddb65669ee418dd85bb98857c29e388678e6372dbaa7a79563d96b1dd7dd38d41a73d6fc5c3b20866cbf5d9fe26e6647fa7655db0b7cc7637d835e627f5f32c5d665f7824caa4ee287c98e2e470b8b189e896f1d16ee3cd4aa265793cd012b679b2db72b34a6e599e0eb4846dbe1b686974dab2ecd3c347963d7606c2695ffcac6b3c47f09df645d1dab8b3d9be405a5b7685e0695f14b5a4125c84a1be5a00bd334c336efb61e271db6354e4a660e4e4a60cd6951bd127b0effc97d0333b26699af6d6774f80bc6f16d18332e71fa5accedbb72e380d7fa8eb462d9cd29c079d9cc3e117ae5a59c63d8e83d38d1b3138efb8118313901b31281339cd5129c94d199c9bdc88c149ca8d40672b3823e0b215b4c7652b68ef93ad20c5275b8d5805b8118397036e045aa8108116ea8895821b81122a30f7122aa4a0850a1168a142045aa8700186132ab4c70915dafb0815527c840a2968a142045aa81081162a44a0850a1168a17aaeed9de65e428514b45021022d5488400bd5ac17470815dae3840aed7d840a293e428514b45021022d5488400b1522d0428508b4502102255460ee255448410b1522d0428508b450ab470dfd850aed714285f63e4285141fa1420a5aa81081162a44a0850a1168a142045aa81081122a30f7122aa4a0850a1168a142045aa8e662e108a1427b9c50a1bd8f5021c547a89082162a44a0850a1168a142045aa81081162a44a0840accbd840a2968a142045aa810d1179ff612a5eb36fb29feaca7f38efde197ae6ca7be371fe56ea20e87a3ea5eb959c39f45b894f231e87cf0f0d0d41bc320621e0b694e513b2eab37b9e69608d485cf6f57fd4ff834e9237f74c93e0b61ae9902f8d1504b704ee5a82fe49b96a0c83bea8bf4a62558751ef565dfa62598068ffa92aed1657d538a9a8e80715f9a69184f1de67dd9ba610e87b82f47370ce108f765e686211ce0be7cdc303c0e7472deb63e1e384e27ebfb4b01a12f1c1b845337a12f2ca1afea740c8531d4696ec250efb90943dde826a0fce9c4e01deb46a13dec46f9b91aca0ceb6a7fa1ba095857438297ab01c6dfd510e5ed6a88f273354c8c58574302d6d5fec9d94df07235c0f8bb1aa2bc5d0d517eae865319d6d59080753524605d3d72427662fc5d0d51deae86283f57c3c51dd6d59080753524605d0d095eae06187f574394b7ab21cacfd5a04a46bb1a12b0ae8604acab21c1cbd500e3ef6a88f2763544f5b9da9c4569b91ae5e186396e11d630c44dc80d435c726e187a544b0d6bcf6aa941f0ac96a0af6a9fe3aaa5a6d3dc84a1de731386bad14d40f9d389c13bd68d427bd88df27335ae5aea72b5bf50dd04acab71d592d3d5b86aa9d7d5b86aa9d7d5b86ac9ed6a5cb5d4e56a5cb5d4e56affe4ec2678b91a572df5ba1a572df5ba1a572db95d8dab96ba5c8dab96ba5c8dab96ba5c3d72427662fc5d8dab967a5d8dab96dcaec6554b5daec6554b5daec6554b5daec6554b4e57e3aaa55e57e3aaa55e57e3aa25b7ab71d55297ab71d55297ab71d55297ab71d592d3d5b86aa9d7d5b86aa9d7d58e6a69efa9f50226cd362f24535f2e5e565cff0677e38199a8fa0d527b11d07cf1265abf28491beb9e04f6955476b3e9b0bd6058b5680c7734b586dbab950700bf7937926961ce721e7dd3a3011a4ff54ff3756cd73f61576faf9bb95ab2acdabb19acfa3b361cda5744b70eefe92ccb55d16a2df6f7af0e8e4e2e6c00d8376a3d72befaaaba64b6e90fb722e5b9f9b479d9d65cffd015d73f64671e08b2efde6abe79ebd4b814be79ebe94c563f3474fb2baefb61c2a67e25d78ef79ab13f7bde6ba6777eb2dbf4fed6abcd5a969b579be9cd97eb579bcdab7fafaa030e7598d6bd3cbe7c7ff9d1e424636a42581d9709601bf88d17a3d914d37a319ad9d678bf9923d242e56416dadfe97204b5fdbdddf50363e6d776b763d0f1a3bc8ef8a98f617dd1bd3b9cdcfd2eb4b87bfa6cc4dfabc62a3f3803dc46f8ae1eaafecce32a86d41f37a98ef7271b9d554fa36756a1d4fe2b1ec75f58f56db9727f35e60b2d53b577ba6f7e9e616bffbcfaa541a77d66a6242760afdd99ea637f9c54ef1eb0f74a38939fcebb1dc36d6edc193bd2d86ca9dbdc3ce3b8dd2933436c7657a3eace9bb0db87f63e0877be3b3d383ca96f5bb0d94698f8d0ded5f72bd97da1fef988e7a264b17d92bd91a0060a372c73150f66e2da764a2b9b6f8f82dda9161f9b64bf350a9de2af82b463ced8315fb82784ffb73c5cff957ff82f000000ffff0300504b03041400060008000000210057afeec777010000e602000011000801646f6350726f70732f636f72652e786d6c20a2040128a00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007c925f6bc23014c5df07fb0e25ef3589c294522b6cc3a709c21c1b7bcb92ab66367f48a2d56fbfb4d5ba0e19f4e1de7b4e7edc9e249f1d55991cc07969f414d1014109686e84d49b297a5bcdd3094a7c605ab0d26898a21378342beeef726e336e1c2c9db1e082049f4492f619b753b40dc166187bbe05c5fc203a7414d7c6291662eb36d832be631bc043421eb082c0040b0cd7c0d4764474460ade21edde950d40700c2528d0c1633aa0f8ea0de094bf79a0517e39950c270b37ad17b1731fbdec8c55550daa51638dfb53fcb178796d7e3595bace8a032a72c1b3204309458eaf65acfcfeeb1b7868c75d136bee8005e38a25d31ac035fa6556a7bd8353659cf0f164af8b36019e3b6943bcc396db1b4477c97c58c44b5d4b108fa7a282921b050de88f54bb1d1c64fd1e0a3a6e2c5d9f9fd36df70291c454b236c38bf23e7a7a5ecd5131247492d2614ac62b32ce0889df67bd5aeffc15a8ce1bfc4b1cd2864857946474d2275e006d3afd9759fc000000ffff0300504b03041400060008000000210042a9f4f656040000cf2d000012000000776f72642f6e756d626572696e672e786d6cec5add8eda3814be5fa9ef8022f57226ff3fa0321503c36aaa6e55b5b3da6b130c58f54fe41828b77d993e421fabafb04e0ce1270c4a0c6259295701dbe7f87c9fcf39fe14e5ddfbef04b71690a788d1ae61df5b460bd2988d119d768dbf5f867791d14a05a0638019855d630553e3fdc39b3fde2d3b744e4690cb852de983a69d6512778d991049c734d378060948ef098a394bd944dcc78c986c32413134978c8f4dc7b2adfc57c2590cd354fae903ba00a9b17647cade5802a99c9c304e80907ff9d424807f9b2777d27b02041a218cc44afab6828d1bd635e69c76d62eee8a8032938e0a68fdd858f02afb2a93018be7045291ef687288650c8ca633946c61e87a9393b38d93c529100b8237eb9689ed9d7706030e96f2b1755825fcb1322258457edaa36d553891cc4561512584fd3d37911080e876632d6a76c8b5fd7a0e9c4307c9f4bcc3f993b379b2f586cef3f64cbf15beb2d2aee16b7dc8bbd0d2f382f93a0389ac4012779ea7947130c2322279642dc97a2b4b6be341b61c304a0507b1f83427adbd7fcfe3ae61e54b688ac6726e01b06c67edc79edd8f868699cd903916e8235c40fcb24ae066cd6c35e268fc573687b339b55690046f56446d370887aea766f0229b40f291ed287f8a04cb4e657956dbb2ac611e836c985c1441283bd92d87a4181cc31811b0de4cfa7a81df8bb9b7f67d31fe21de8c6238116a38f9ccb307a219ce6cb86b385698c73203749a776e37b0b2c5e67ab5993b3b0cdf3e0cdf6ee723b205c93eb680d98a6a70305b42fe110a01f971484e7d48615b03925382f4780ea42f8c007a1c917b0c1147d3d9eb905cdfde8764471520b947924c0fd2c9a4f36a9f90e7b81a27e45d2fe9fcfa90dabe0624ff6a4917d44f3a3f38680d95922eb84ed285b54f287075da4278bda48b6a430aed83b650095274b5a46bd74fba303a680daf249db97789675e4edef00ad1ee0defb841df7a8a1c1589ee0d1f5a8fd1e0a91d15380b96cb377c555647738ce19aa103467ffff8553b479c9329b2ecf0f563c8a84833e6d218497df87545460ce7a63dc9dbde00a2222bcf0990ccac9de55e2a8a054b5d4cf5f3ed0433ac2e2fb6e7e911d367738e206f7d82cb1d760e46e3b4bcb01e6b253d62a9cbe2a2acfdfef1b32e6f8e1de8f1f68f5c9dbd1c487758db1fab475059dda844bb3041b50bce89a2ffbae24a4ae9262a4ef270d3155712633752719eabd9c22f5d716569771b15e75b9aadfc72155792893751717ea8d9abaf547125257a231517789a2dfcfc8aaba96b9d9c9f5d5deb79bdbef3346c2b70babab6170d7abe3b0c0ae68a33bb993757b585ed0564ebf54bb891a97a25dcc8d446a6ea555c2353f52aae91a98d4cd5abb846a6ea55dcff47a62ae5b42b53fda7c8093db7a7c0e9ca54271c78be5d4da636af5f9bd7af8dae6d746da36b1b5d5b87b746d736ba56afe21a5dab577137a56b69ae67e9ee67047be2768f17335f5932536f698f9a6d801d3353aaf9a859fed9c22b66a50f1eb766eeae997aaa0fb11ffe050000ffff0300504b030414000600080000002100a0454269070200000d08000012000000776f72642f666f6e745461626c652e786d6cdc945d6bdb301486ef07fb0f46f78d3fe27c34d4292c6b603076b175ec5a56645b4cd2313a4adcfcfb1ddb49bb90a424140a9b85b1fc1ee9d5f1c339bebb7f323ad848870a6cc6e241c4026905ac942d33f6f371793365017a6e575c839519db4a64f7f38f1fee9a5901d66340fb2dce8cc858e57d3d0b431495341c07504b4bc1029ce19e5e5d191aee7eafeb1b01a6e65ee54a2bbf0d93281ab39d8dbbc4058a4209f919c4da48ebbbfda1939a1cc162a56adcbb3597b835e056b5032111e99b8deefd0c57f6d9264e8f8c8c120e100a3fa08fd965d459d1f638ea6646bf188cae33489e0d8c987d292d389e6b824f990464c6e63bfa4133b3dc50e0c7d6e4a03bbde61650c614da709db16844238edaac26d1989ea368c2c276a1a8b843d97af40b935e2eb8517abb571d186efb40adbca8f6fa863bd5e6d48750951458631e91cfee62bd1253511d2ac9d19ae1a1223a9fe9a112ffb586ce0c7b0047201e9591187c934df0bdcbfc149184c6381a128994ee8466e96922dd496f27f24039270fcbe50b91052993e9e8d31191dbd78874af71ef73399105ac9d92ae657286c68408dc76545a1ae955340caca43b85a3504f7275398b74f81e2c7e5187b77f363cd32947d7159dc2d71efea1465970ad72a7ce94c4b22b8576a4541cc95525818d42bcae41d2534591a493f769909e44f05595953fcba3a5f09ff2d84d70fe070000ffff0300504b0304140006000800000021008b8d1fc57a010000ce02000010000801646f6350726f70732f6170702e786d6c20a2040128a00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c524d4fc3300cbd23f11faade59bac1f89297096d421cf89256e01c256e1b912651924ddbbfc75da10cc1899cec67fbe5f92530dfb626db6088dad9593e1e157986563aa56d3dcb5fcadb93cb3c8b4958258cb338cb7718f3393f3e82e7e03c86a431664461e32c6f52f2d78c45d9602be288ca962a950bad4894869ab9aad212974eae5bb4894d8ae29ce136a155a84efc4098f78cd79bf45f52e564a72fbe963b4f7c1c4a6cbd1109f963376946caa516d88042e99230a56e915f113c24f02c6a8cfc0c581fc09b0b2af2e9e402581fc2a21141c8440ef2d3a220fc00801bef8d962291b9fc41cbe0a2ab52f6b4579c7504c00e5b80b658a15c079d76bc007698c2bdb6a4603205d647a42d883a08df447ed1091c32584961704106f04a9888c0be0158b8d60b4b7c6c8888ef3dbef8d22d3b2f3e477e82076bbee9d4acbc9024e1746fc49f2558118a8a3618340c00dcd1ab04d35d40b3b646f5d5f3bbd059f8da7f4f3e9e8e0a3a7bcfbe305a7cf837fc030000ffff0300504b01022d001400060008000000210032916f5766010000a50500001300000000000000000000000000000000005b436f6e74656e745f54797065735d2e786d6c504b01022d00140006000800000021001e911ab7ef0000004e0200000b000000000000000000000000009f0300005f72656c732f2e72656c73504b01022d0014000600080000002100b3be8b1d05010000b60300001c00000000000000000000000000bf060000776f72642f5f72656c732f646f63756d656e742e786d6c2e72656c73504b01022d0014000600080000002100711cae0bf70e0000bdcb0000110000000000000000000000000006090000776f72642f646f63756d656e742e786d6c504b01022d0014000600080000002100aa5225df230600008b1a000015000000000000000000000000002c180000776f72642f7468656d652f7468656d65312e786d6c504b01022d001400060008000000210068272c5d09040000300b00001100000000000000000000000000821e0000776f72642f73657474696e67732e786d6c504b01022d001400060008000000210024efb64413010000ff0100001400000000000000000000000000ba220000776f72642f77656253657474696e67732e786d6c504b01022d0014000600080000002100b0d9d3c3450c0000327500000f00000000000000000000000000ff230000776f72642f7374796c65732e786d6c504b01022d001400060008000000210057afeec777010000e6020000110000000000000000000000000071300000646f6350726f70732f636f72652e786d6c504b01022d001400060008000000210042a9f4f656040000cf2d000012000000000000000000000000001f330000776f72642f6e756d626572696e672e786d6c504b01022d0014000600080000002100a0454269070200000d0800001200000000000000000000000000a5370000776f72642f666f6e745461626c652e786d6c504b01022d00140006000800000021008b8d1fc57a010000ce0200001000000000000000000000000000dc390000646f6350726f70732f6170702e786d6c504b0506000000000c000c00010300008c3c00000000, 'azee', 'h5fdnz65', '2024-11-21 06:33:54', 'FWFS', 'accepted');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cloudprovider`
--
ALTER TABLE `cloudprovider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_owner`
--
ALTER TABLE `data_owner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_user`
--
ALTER TABLE `data_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fileupload`
--
ALTER TABLE `fileupload`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cloudprovider`
--
ALTER TABLE `cloudprovider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_owner`
--
ALTER TABLE `data_owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_user`
--
ALTER TABLE `data_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fileupload`
--
ALTER TABLE `fileupload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
