USE [MockData]
GO

/*
************REMEMBER*****************
You will need to modify lines 1169, 1219 and 1548
so that the @filepath points to the location of the CSV Files on your commputer/server.


*/

IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'Data')
BEGIN
EXEC('DROP SCHEMA Data')
END
GO
--Create Schema
CREATE SCHEMA [Data]
GO

IF OBJECT_ID('data.Business','u') IS NOT NULL
BEGIN
DROP TABLE data.Business
END

CREATE TABLE [data].[Business](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [varchar](200) NOT NULL)

SET ANSI_PADDING OFF
GO

IF OBJECT_ID('data.Street_Name','u') IS NOT NULL
BEGIN
DROP TABLE data.Street_Name 
END

CREATE TABLE data.Street_Name(
ID INT Identity NOT NULL PRIMARY KEY,
Name Varchar(100) NOT NULL)

IF OBJECT_ID('data.town','u') IS NOT NULL
BEGIN
DROP TABLE data.town
END

CREATE TABLE data.town(
ID INT Identity NOT NULL PRIMARY KEY,
Name VARCHAR(50) NOT  NULL
)

IF OBJECT_ID('data.Location','u') IS NOT NULL
BEGIN
DROP TABLE data.location
END

CREATE TABLE data.location(
ID INT IDENTITY NOT NULL PRIMARY KEY,
COUNTY VARCHAR(50) NOT NULL,
COUNTRY VARCHAR(50) NOT NULL
)

IF OBJECT_ID('data.Birth_Date','U') IS NOT NULL
BEGIN
DROP TABLE data.Birth_Date
END

CREATE TABLE data.Birth_Date(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Birth_Date date NOT NULL)

IF OBJECT_ID('dbo.Email','U') IS NOT NULL
BEGIN
DROP TABLE dbo.Email 
END

IF OBJECT_ID('dbo.Domain','U') IS NOT NULL
BEGIN
DROP TABLE dbo.domain 
END

CREATE TABLE dbo.Email(
ID INT Identity NOT NULL PRIMARY KEY,
NAME Varchar(20) NULL
)

INSERT INTO dbo.Email(Name)
VALUES('gmail.com'),
('Hotmail.com'),
('yahoo.com'),
('AOL.com'),
('Outlook.com'),
('Hush.net'),
('Monk.web'),
('Online.co.uk'),
('CSI.net'),
('Quantum.com'),
('Mail.com')

CREATE TABLE dbo.Domain(
ID INT IDENTITY NOT NULL PRIMARY KEY,
NAME Varchar(6) NOT NULL UNIQUE
)

INSERT INTO dbo.Domain(Name)
VALUES('.net'),
('.com'),
('.co.uk'),
('.web'),
('.gov'),
('.org'),
('.edu')




IF Object_ID('dbo.Street_Type','u') IS NOT NULL
BEGIN
DROP TABLE dbo.Street_Type
END

CREATE TABLE dbo.Street_Type(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Name Varchar(20) NOT NULL UNIQUE)

INSERT INTO dbo.Street_Type(Name)
VALUES
('Street'),
('Road'),
('Mews'),
('Close'),
('Avenue'),
('Square'),
('Way'),
('Place'),
('Drive'),
('Grove'),
('Boulevard'),
('Court'),
('Heights'),
('Lane'),
('Terrace')







IF OBJECT_ID('dbo.town','u') IS NOT NULL
BEGIN
DROP TABLE dbo.town
END

CREATE TABLE dbo.town (
  town_id INT IDENTITY NOT NULL PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
)

--
-- Dumping data for table `towns`
--
SET IDENTITY_INSERT town ON
INSERT INTO town (town_id, name) VALUES
(1, 'Aberaeron'),
(2, 'Aberdare'),
(3, 'Aberdeen'),
(4, 'Aberfeldy'),
(5, 'Abergavenny'),
(6, 'Abergele'),
(7, 'Abertillery'),
(8, 'Aberystwyth'),
(9, 'Abingdon'),
(10, 'Accrington'),
(11, 'Adlington'),
(12, 'Airdrie'),
(13, 'Alcester'),
(14, 'Aldeburgh'),
(15, 'Aldershot'),
(16, 'Aldridge'),
(17, 'Alford'),
(18, 'Alfreton'),
(19, 'Alloa'),
(20, 'Alnwick'),
(21, 'Alsager'),
(22, 'Alston'),
(23, 'Amesbury'),
(24, 'Amlwch'),
(25, 'Ammanford'),
(26, 'Ampthill'),
(27, 'Andover'),
(28, 'Annan'),
(29, 'Antrim'),
(30, 'Appleby in Westmorland'),
(31, 'Arbroath'),
(32, 'Armagh'),
(33, 'Arundel'),
(34, 'Ashbourne'),
(35, 'Ashburton'),
(36, 'Ashby de la Zouch'),
(37, 'Ashford'),
(38, 'Ashington'),
(39, 'Ashton in Makerfield'),
(40, 'Atherstone'),
(41, 'Auchtermuchty'),
(42, 'Axminster'),
(43, 'Aylesbury'),
(44, 'Aylsham'),
(45, 'Ayr'),
(46, 'Bacup'),
(47, 'Bakewell'),
(48, 'Bala'),
(49, 'Ballater'),
(50, 'Ballycastle'),
(51, 'Ballyclare'),
(52, 'Ballymena'),
(53, 'Ballymoney'),
(54, 'Ballynahinch'),
(55, 'Banbridge'),
(56, 'Banbury'),
(57, 'Banchory'),
(58, 'Banff'),
(59, 'Bangor'),
(60, 'Barmouth'),
(61, 'Barnard Castle'),
(62, 'Barnet'),
(63, 'Barnoldswick'),
(64, 'Barnsley'),
(65, 'Barnstaple'),
(66, 'Barrhead'),
(67, 'Barrow in Furness'),
(68, 'Barry'),
(69, 'Barton upon Humber'),
(70, 'Basildon'),
(71, 'Basingstoke'),
(72, 'Bath'),
(73, 'Bathgate'),
(74, 'Batley'),
(75, 'Battle'),
(76, 'Bawtry'),
(77, 'Beaconsfield'),
(78, 'Bearsden'),
(79, 'Beaumaris'),
(80, 'Bebington'),
(81, 'Beccles'),
(82, 'Bedale'),
(83, 'Bedford'),
(84, 'Bedlington'),
(85, 'Bedworth'),
(86, 'Beeston'),
(87, 'Bellshill'),
(88, 'Belper'),
(89, 'Berkhamsted'),
(90, 'Berwick upon Tweed'),
(91, 'Betws y Coed'),
(92, 'Beverley'),
(93, 'Bewdley'),
(94, 'Bexhill on Sea'),
(95, 'Bicester'),
(96, 'Biddulph'),
(97, 'Bideford'),
(98, 'Biggar'),
(99, 'Biggleswade'),
(100, 'Billericay'),
(101, 'Bilston'),
(102, 'Bingham'),
(103, 'Birkenhead'),
(104, 'Birmingham'),
(105, 'Bishop Auckland'),
(106, 'Blackburn'),
(107, 'Blackheath'),
(108, 'Blackpool'),
(109, 'Blaenau Ffestiniog'),
(110, 'Blandford Forum'),
(111, 'Bletchley'),
(112, 'Bloxwich'),
(113, 'Blyth'),
(114, 'Bodmin'),
(115, 'Bognor Regis'),
(116, 'Bollington'),
(117, 'Bolsover'),
(118, 'Bolton'),
(119, 'Bootle'),
(120, 'Borehamwood'),
(121, 'Boston'),
(122, 'Bourne'),
(123, 'Bournemouth'),
(124, 'Brackley'),
(125, 'Bracknell'),
(126, 'Bradford'),
(127, 'Bradford on Avon'),
(128, 'Brading'),
(129, 'Bradley Stoke'),
(130, 'Bradninch'),
(131, 'Braintree'),
(132, 'Brechin'),
(133, 'Brecon'),
(134, 'Brentwood'),
(135, 'Bridge of Allan'),
(136, 'Bridgend'),
(137, 'Bridgnorth'),
(138, 'Bridgwater'),
(139, 'Bridlington'),
(140, 'Bridport'),
(141, 'Brigg'),
(142, 'Brighouse'),
(143, 'Brightlingsea'),
(144, 'Brighton'),
(145, 'Bristol'),
(146, 'Brixham'),
(147, 'Broadstairs'),
(148, 'Bromsgrove'),
(149, 'Bromyard'),
(150, 'Brynmawr'),
(151, 'Buckfastleigh'),
(152, 'Buckie'),
(153, 'Buckingham'),
(154, 'Buckley'),
(155, 'Bude'),
(156, 'Budleigh Salterton'),
(157, 'Builth Wells'),
(158, 'Bungay'),
(159, 'Buntingford'),
(160, 'Burford'),
(161, 'Burgess Hill'),
(162, 'Burnham on Crouch'),
(163, 'Burnham on Sea'),
(164, 'Burnley'),
(165, 'Burntisland'),
(166, 'Burntwood'),
(167, 'Burry Port'),
(168, 'Burton Latimer'),
(169, 'Bury'),
(170, 'Bushmills'),
(171, 'Buxton'),
(172, 'Caernarfon'),
(173, 'Caerphilly'),
(174, 'Caistor'),
(175, 'Caldicot'),
(176, 'Callander'),
(177, 'Calne'),
(178, 'Camberley'),
(179, 'Camborne'),
(180, 'Cambridge'),
(181, 'Camelford'),
(182, 'Campbeltown'),
(183, 'Cannock'),
(184, 'Canterbury'),
(185, 'Cardiff'),
(186, 'Cardigan'),
(187, 'Carlisle'),
(188, 'Carluke'),
(189, 'Carmarthen'),
(190, 'Carnforth'),
(191, 'Carnoustie'),
(192, 'Carrickfergus'),
(193, 'Carterton'),
(194, 'Castle Douglas'),
(195, 'Castlederg'),
(196, 'Castleford'),
(197, 'Castlewellan'),
(198, 'Chard'),
(199, 'Charlbury'),
(200, 'Chatham'),
(201, 'Chatteris'),
(202, 'Chelmsford'),
(203, 'Cheltenham'),
(204, 'Chepstow'),
(205, 'Chesham'),
(206, 'Cheshunt'),
(207, 'Chester'),
(208, 'Chester le Street'),
(209, 'Chesterfield'),
(210, 'Chichester'),
(211, 'Chippenham'),
(212, 'Chipping Campden'),
(213, 'Chipping Norton'),
(214, 'Chipping Sodbury'),
(215, 'Chorley'),
(216, 'Christchurch'),
(217, 'Church Stretton'),
(218, 'Cinderford'),
(219, 'Cirencester'),
(220, 'Clacton on Sea'),
(221, 'Cleckheaton'),
(222, 'Cleethorpes'),
(223, 'Clevedon'),
(224, 'Clitheroe'),
(225, 'Clogher'),
(226, 'Clydebank'),
(227, 'Coalisland'),
(228, 'Coalville'),
(229, 'Coatbridge'),
(230, 'Cockermouth'),
(231, 'Coggeshall'),
(232, 'Colchester'),
(233, 'Coldstream'),
(234, 'Coleraine'),
(235, 'Coleshill'),
(236, 'Colne'),
(237, 'Colwyn Bay'),
(238, 'Comber'),
(239, 'Congleton'),
(240, 'Conwy'),
(241, 'Cookstown'),
(242, 'Corbridge'),
(243, 'Corby'),
(244, 'Coventry'),
(245, 'Cowbridge'),
(246, 'Cowdenbeath'),
(247, 'Cowes'),
(248, 'Craigavon'),
(249, 'Cramlington'),
(250, 'Crawley'),
(251, 'Crayford'),
(252, 'Crediton'),
(253, 'Crewe'),
(254, 'Crewkerne'),
(255, 'Criccieth'),
(256, 'Crickhowell'),
(257, 'Crieff'),
(258, 'Cromarty'),
(259, 'Cromer'),
(260, 'Crowborough'),
(261, 'Crowthorne'),
(262, 'Crumlin'),
(263, 'Cuckfield'),
(264, 'Cullen'),
(265, 'Cullompton'),
(266, 'Cumbernauld'),
(267, 'Cupar'),
(268, 'Cwmbran'),
(269, 'Dalbeattie'),
(270, 'Dalkeith'),
(271, 'Darlington'),
(272, 'Dartford'),
(273, 'Dartmouth'),
(274, 'Darwen'),
(275, 'Daventry'),
(276, 'Dawlish'),
(277, 'Deal'),
(278, 'Denbigh'),
(279, 'Denton'),
(280, 'Derby'),
(281, 'Dereham'),
(282, 'Devizes'),
(283, 'Dewsbury'),
(284, 'Didcot'),
(285, 'Dingwall'),
(286, 'Dinnington'),
(287, 'Diss'),
(288, 'Dolgellau'),
(289, 'Donaghadee'),
(290, 'Doncaster'),
(291, 'Dorchester'),
(292, 'Dorking'),
(293, 'Dornoch'),
(294, 'Dover'),
(295, 'Downham Market'),
(296, 'Downpatrick'),
(297, 'Driffield'),
(298, 'Dronfield'),
(299, 'Droylsden'),
(300, 'Dudley'),
(301, 'Dufftown'),
(302, 'Dukinfield'),
(303, 'Dumbarton'),
(304, 'Dumfries'),
(305, 'Dunbar'),
(306, 'Dunblane'),
(307, 'Dundee'),
(308, 'Dunfermline'),
(309, 'Dungannon'),
(310, 'Dunoon'),
(311, 'Duns'),
(312, 'Dunstable'),
(313, 'Durham'),
(314, 'Dursley'),
(315, 'Easingwold'),
(316, 'East Grinstead'),
(317, 'East Kilbride'),
(318, 'Eastbourne'),
(319, 'Eastleigh'),
(320, 'Eastwood'),
(321, 'Ebbw Vale'),
(322, 'Edenbridge'),
(323, 'Edinburgh'),
(324, 'Egham'),
(325, 'Elgin'),
(326, 'Ellesmere'),
(327, 'Ellesmere Port'),
(328, 'Ely'),
(329, 'Enniskillen'),
(330, 'Epping'),
(331, 'Epsom'),
(332, 'Erith'),
(333, 'Esher'),
(334, 'Evesham'),
(335, 'Exeter'),
(336, 'Exmouth'),
(337, 'Eye'),
(338, 'Eyemouth'),
(339, 'Failsworth'),
(340, 'Fairford'),
(341, 'Fakenham'),
(342, 'Falkirk'),
(343, 'Falkland'),
(344, 'Falmouth'),
(345, 'Fareham'),
(346, 'Faringdon'),
(347, 'Farnborough'),
(348, 'Farnham'),
(349, 'Farnworth'),
(350, 'Faversham'),
(351, 'Felixstowe'),
(352, 'Ferndown'),
(353, 'Filey'),
(354, 'Fintona'),
(355, 'Fishguard'),
(356, 'Fivemiletown'),
(357, 'Fleet'),
(358, 'Fleetwood'),
(359, 'Flint'),
(360, 'Flitwick'),
(361, 'Folkestone'),
(362, 'Fordingbridge'),
(363, 'Forfar'),
(364, 'Forres'),
(365, 'Fort William'),
(366, 'Fowey'),
(367, 'Framlingham'),
(368, 'Fraserburgh'),
(369, 'Frodsham'),
(370, 'Frome'),
(371, 'Gainsborough'),
(372, 'Galashiels'),
(373, 'Gateshead'),
(374, 'Gillingham'),
(375, 'Glasgow'),
(376, 'Glastonbury'),
(377, 'Glossop'),
(378, 'Gloucester'),
(379, 'Godalming'),
(380, 'Godmanchester'),
(381, 'Goole'),
(382, 'Gorseinon'),
(383, 'Gosport'),
(384, 'Gourock'),
(385, 'Grange over Sands'),
(386, 'Grangemouth'),
(387, 'Grantham'),
(388, 'Grantown on Spey'),
(389, 'Gravesend'),
(390, 'Grays'),
(391, 'Great Yarmouth'),
(392, 'Greenock'),
(393, 'Grimsby'),
(394, 'Guildford'),
(395, 'Haddington'),
(396, 'Hadleigh'),
(397, 'Hailsham'),
(398, 'Halesowen'),
(399, 'Halesworth'),
(400, 'Halifax'),
(401, 'Halstead'),
(402, 'Haltwhistle'),
(403, 'Hamilton'),
(404, 'Harlow'),
(405, 'Harpenden'),
(406, 'Harrogate'),
(407, 'Hartlepool'),
(408, 'Harwich'),
(409, 'Haslemere'),
(410, 'Hastings'),
(411, 'Hatfield'),
(412, 'Havant'),
(413, 'Haverfordwest'),
(414, 'Haverhill'),
(415, 'Hawarden'),
(416, 'Hawick'),
(417, 'Hay on Wye'),
(418, 'Hayle'),
(419, 'Haywards Heath'),
(420, 'Heanor'),
(421, 'Heathfield'),
(422, 'Hebden Bridge'),
(423, 'Helensburgh'),
(424, 'Helston'),
(425, 'Hemel Hempstead'),
(426, 'Henley on Thames'),
(427, 'Hereford'),
(428, 'Herne Bay'),
(429, 'Hertford'),
(430, 'Hessle'),
(431, 'Heswall'),
(432, 'Hexham'),
(433, 'High Wycombe'),
(434, 'Higham Ferrers'),
(435, 'Highworth'),
(436, 'Hinckley'),
(437, 'Hitchin'),
(438, 'Hoddesdon'),
(439, 'Holmfirth'),
(440, 'Holsworthy'),
(441, 'Holyhead'),
(442, 'Holywell'),
(443, 'Honiton'),
(444, 'Horley'),
(445, 'Horncastle'),
(446, 'Hornsea'),
(447, 'Horsham'),
(448, 'Horwich'),
(449, 'Houghton le Spring'),
(450, 'Hove'),
(451, 'Howden'),
(452, 'Hoylake'),
(453, 'Hucknall'),
(454, 'Huddersfield'),
(455, 'Hungerford'),
(456, 'Hunstanton'),
(457, 'Huntingdon'),
(458, 'Huntly'),
(459, 'Hyde'),
(460, 'Hythe'),
(461, 'Ilford'),
(462, 'Ilfracombe'),
(463, 'Ilkeston'),
(464, 'Ilkley'),
(465, 'Ilminster'),
(466, 'Innerleithen'),
(467, 'Inveraray'),
(468, 'Inverkeithing'),
(469, 'Inverness'),
(470, 'Inverurie'),
(471, 'Ipswich'),
(472, 'Irthlingborough'),
(473, 'Irvine'),
(474, 'Ivybridge'),
(475, 'Jarrow'),
(476, 'Jedburgh'),
(477, 'Johnstone'),
(478, 'Keighley'),
(479, 'Keith'),
(480, 'Kelso'),
(481, 'Kempston'),
(482, 'Kendal'),
(483, 'Kenilworth'),
(484, 'Kesgrave'),
(485, 'Keswick'),
(486, 'Kettering'),
(487, 'Keynsham'),
(488, 'Kidderminster'),
(489, 'Kilbarchan'),
(490, 'Kilkeel'),
(491, 'Killyleagh'),
(492, 'Kilmarnock'),
(493, 'Kilwinning'),
(494, 'Kinghorn'),
(495, 'Kingsbridge'),
(496, 'Kington'),
(497, 'Kingussie'),
(498, 'Kinross'),
(499, 'Kintore'),
(500, 'Kirkby'),
(501, 'Kirkby Lonsdale'),
(502, 'Kirkcaldy'),
(503, 'Kirkcudbright'),
(504, 'Kirkham'),
(505, 'Kirkwall'),
(506, 'Kirriemuir'),
(507, 'Knaresborough'),
(508, 'Knighton'),
(509, 'Knutsford'),
(510, 'Ladybank'),
(511, 'Lampeter'),
(512, 'Lanark'),
(513, 'Lancaster'),
(514, 'Langholm'),
(515, 'Largs'),
(516, 'Larne'),
(517, 'Laugharne'),
(518, 'Launceston'),
(519, 'Laurencekirk'),
(520, 'Leamington Spa'),
(521, 'Leatherhead'),
(522, 'Ledbury'),
(523, 'Leeds'),
(524, 'Leek'),
(525, 'Leicester'),
(526, 'Leighton Buzzard'),
(527, 'Leiston'),
(528, 'Leominster'),
(529, 'Lerwick'),
(530, 'Letchworth'),
(531, 'Leven'),
(532, 'Lewes'),
(533, 'Leyland'),
(534, 'Lichfield'),
(535, 'Limavady'),
(536, 'Lincoln'),
(537, 'Linlithgow'),
(538, 'Lisburn'),
(539, 'Liskeard'),
(540, 'Lisnaskea'),
(541, 'Littlehampton'),
(542, 'Liverpool'),
(543, 'Llandeilo'),
(544, 'Llandovery'),
(545, 'Llandrindod Wells'),
(546, 'Llandudno'),
(547, 'Llanelli'),
(548, 'Llanfyllin'),
(549, 'Llangollen'),
(550, 'Llanidloes'),
(551, 'Llanrwst'),
(552, 'Llantrisant'),
(553, 'Llantwit Major'),
(554, 'Llanwrtyd Wells'),
(555, 'Loanhead'),
(556, 'Lochgilphead'),
(557, 'Lockerbie'),
(558, 'Londonderry'),
(559, 'Long Eaton'),
(560, 'Longridge'),
(561, 'Looe'),
(562, 'Lossiemouth'),
(563, 'Lostwithiel'),
(564, 'Loughborough'),
(565, 'Loughton'),
(566, 'Louth'),
(567, 'Lowestoft'),
(568, 'Ludlow'),
(569, 'Lurgan'),
(570, 'Luton'),
(571, 'Lutterworth'),
(572, 'Lydd'),
(573, 'Lydney'),
(574, 'Lyme Regis'),
(575, 'Lymington'),
(576, 'Lynton'),
(577, 'Mablethorpe'),
(578, 'Macclesfield'),
(579, 'Machynlleth'),
(580, 'Maesteg'),
(581, 'Magherafelt'),
(582, 'Maidenhead'),
(583, 'Maidstone'),
(584, 'Maldon'),
(585, 'Malmesbury'),
(586, 'Malton'),
(587, 'Malvern'),
(588, 'Manchester'),
(589, 'Manningtree'),
(590, 'Mansfield'),
(591, 'March'),
(592, 'Margate'),
(593, 'Market Deeping'),
(594, 'Market Drayton'),
(595, 'Market Harborough'),
(596, 'Market Rasen'),
(597, 'Market Weighton'),
(598, 'Markethill'),
(599, 'Markinch'),
(600, 'Marlborough'),
(601, 'Marlow'),
(602, 'Maryport'),
(603, 'Matlock'),
(604, 'Maybole'),
(605, 'Melksham'),
(606, 'Melrose'),
(607, 'Melton Mowbray'),
(608, 'Merthyr Tydfil'),
(609, 'Mexborough'),
(610, 'Middleham'),
(611, 'Middlesbrough'),
(612, 'Middlewich'),
(613, 'Midhurst'),
(614, 'Midsomer Norton'),
(615, 'Milford Haven'),
(616, 'Milngavie'),
(617, 'Milton Keynes'),
(618, 'Minehead'),
(619, 'Moffat'),
(620, 'Mold'),
(621, 'Monifieth'),
(622, 'Monmouth'),
(623, 'Montgomery'),
(624, 'Montrose'),
(625, 'Morecambe'),
(626, 'Moreton in Marsh'),
(627, 'Moretonhampstead'),
(628, 'Morley'),
(629, 'Morpeth'),
(630, 'Motherwell'),
(631, 'Musselburgh'),
(632, 'Nailsea'),
(633, 'Nailsworth'),
(634, 'Nairn'),
(635, 'Nantwich'),
(636, 'Narberth'),
(637, 'Neath'),
(638, 'Needham Market'),
(639, 'Neston'),
(640, 'New Mills'),
(641, 'New Milton'),
(642, 'Newbury'),
(643, 'Newcastle'),
(644, 'Newcastle Emlyn'),
(645, 'Newcastle upon Tyne'),
(646, 'Newent'),
(647, 'Newhaven'),
(648, 'Newmarket'),
(649, 'Newport'),
(650, 'Newport Pagnell'),
(651, 'Newport on Tay'),
(652, 'Newquay'),
(653, 'Newry'),
(654, 'Newton Abbot'),
(655, 'Newton Aycliffe'),
(656, 'Newton Stewart'),
(657, 'Newton le Willows'),
(658, 'Newtown'),
(659, 'Newtownabbey'),
(660, 'Newtownards'),
(661, 'Normanton'),
(662, 'North Berwick'),
(663, 'North Walsham'),
(664, 'Northallerton'),
(665, 'Northampton'),
(666, 'Northwich'),
(667, 'Norwich'),
(668, 'Nottingham'),
(669, 'Nuneaton'),
(670, 'Oakham'),
(671, 'Oban'),
(672, 'Okehampton'),
(673, 'Oldbury'),
(674, 'Oldham'),
(675, 'Oldmeldrum'),
(676, 'Olney'),
(677, 'Omagh'),
(678, 'Ormskirk'),
(679, 'Orpington'),
(680, 'Ossett'),
(681, 'Oswestry'),
(682, 'Otley'),
(683, 'Oundle'),
(684, 'Oxford'),
(685, 'Padstow'),
(686, 'Paignton'),
(687, 'Painswick'),
(688, 'Paisley'),
(689, 'Peebles'),
(690, 'Pembroke'),
(691, 'Penarth'),
(692, 'Penicuik'),
(693, 'Penistone'),
(694, 'Penmaenmawr'),
(695, 'Penrith'),
(696, 'Penryn'),
(697, 'Penzance'),
(698, 'Pershore'),
(699, 'Perth'),
(700, 'Peterborough'),
(701, 'Peterhead'),
(702, 'Peterlee'),
(703, 'Petersfield'),
(704, 'Petworth'),
(705, 'Pickering'),
(706, 'Pitlochry'),
(707, 'Pittenweem'),
(708, 'Plymouth'),
(709, 'Pocklington'),
(710, 'Polegate'),
(711, 'Pontefract'),
(712, 'Pontypridd'),
(713, 'Poole'),
(714, 'Port Talbot'),
(715, 'Portadown'),
(716, 'Portaferry'),
(717, 'Porth'),
(718, 'Porthcawl'),
(719, 'Porthmadog'),
(720, 'Portishead'),
(721, 'Portrush'),
(722, 'Portsmouth'),
(723, 'Portstewart'),
(724, 'Potters Bar'),
(725, 'Potton'),
(726, 'Poulton le Fylde'),
(727, 'Prescot'),
(728, 'Prestatyn'),
(729, 'Presteigne'),
(730, 'Preston'),
(731, 'Prestwick'),
(732, 'Princes Risborough'),
(733, 'Prudhoe'),
(734, 'Pudsey'),
(735, 'Pwllheli'),
(736, 'Ramsgate'),
(737, 'Randalstown'),
(738, 'Rayleigh'),
(739, 'Reading'),
(740, 'Redcar'),
(741, 'Redditch'),
(742, 'Redhill'),
(743, 'Redruth'),
(744, 'Reigate'),
(745, 'Retford'),
(746, 'Rhayader'),
(747, 'Rhuddlan'),
(748, 'Rhyl'),
(749, 'Richmond'),
(750, 'Rickmansworth'),
(751, 'Ringwood'),
(752, 'Ripley'),
(753, 'Ripon'),
(754, 'Rochdale'),
(755, 'Rochester'),
(756, 'Rochford'),
(757, 'Romford'),
(758, 'Romsey'),
(759, 'Ross on Wye'),
(760, 'Rostrevor'),
(761, 'Rothbury'),
(762, 'Rotherham'),
(763, 'Rothesay'),
(764, 'Rowley Regis'),
(765, 'Royston'),
(766, 'Rugby'),
(767, 'Rugeley'),
(768, 'Runcorn'),
(769, 'Rushden'),
(770, 'Rutherglen'),
(771, 'Ruthin'),
(772, 'Ryde'),
(773, 'Rye'),
(774, 'Saffron Walden'),
(775, 'Saintfield'),
(776, 'Salcombe'),
(777, 'Sale'),
(778, 'Salford'),
(779, 'Salisbury'),
(780, 'Saltash'),
(781, 'Saltcoats'),
(782, 'Sandbach'),
(783, 'Sandhurst'),
(784, 'Sandown'),
(785, 'Sandwich'),
(786, 'Sandy'),
(787, 'Sawbridgeworth'),
(788, 'Saxmundham'),
(789, 'Scarborough'),
(790, 'Scunthorpe'),
(791, 'Seaford'),
(792, 'Seaton'),
(793, 'Sedgefield'),
(794, 'Selby'),
(795, 'Selkirk'),
(796, 'Selsey'),
(797, 'Settle'),
(798, 'Sevenoaks'),
(799, 'Shaftesbury'),
(800, 'Shanklin'),
(801, 'Sheerness'),
(802, 'Sheffield'),
(803, 'Shepshed'),
(804, 'Shepton Mallet'),
(805, 'Sherborne'),
(806, 'Sheringham'),
(807, 'Shildon'),
(808, 'Shipston on Stour'),
(809, 'Shoreham by Sea'),
(810, 'Shrewsbury'),
(811, 'Sidmouth'),
(812, 'Sittingbourne'),
(813, 'Skegness'),
(814, 'Skelmersdale'),
(815, 'Skipton'),
(816, 'Sleaford'),
(817, 'Slough'),
(818, 'Smethwick'),
(819, 'Soham'),
(820, 'Solihull'),
(821, 'Somerton'),
(822, 'South Molton'),
(823, 'South Shields'),
(824, 'South Woodham Ferrers'),
(825, 'Southam'),
(826, 'Southampton'),
(827, 'Southborough'),
(828, 'Southend on Sea'),
(829, 'Southport'),
(830, 'Southsea'),
(831, 'Southwell'),
(832, 'Southwold'),
(833, 'Spalding'),
(834, 'Spennymoor'),
(835, 'Spilsby'),
(836, 'Stafford'),
(837, 'Staines'),
(838, 'Stamford'),
(839, 'Stanley'),
(840, 'Staveley'),
(841, 'Stevenage'),
(842, 'Stirling'),
(843, 'Stockport'),
(844, 'Stockton on Tees'),
(845, 'Stoke on Trent'),
(846, 'Stone'),
(847, 'Stowmarket'),
(848, 'Strabane'),
(849, 'Stranraer'),
(850, 'Stratford upon Avon'),
(851, 'Strood'),
(852, 'Stroud'),
(853, 'Sudbury'),
(854, 'Sunderland'),
(855, 'Sutton Coldfield'),
(856, 'Sutton in Ashfield'),
(857, 'Swadlincote'),
(858, 'Swanage'),
(859, 'Swanley'),
(860, 'Swansea'),
(861, 'Swindon'),
(862, 'Tadcaster'),
(863, 'Tadley'),
(864, 'Tain'),
(865, 'Talgarth'),
(866, 'Tamworth'),
(867, 'Taunton'),
(868, 'Tavistock'),
(869, 'Teignmouth'),
(870, 'Telford'),
(871, 'Tenby'),
(872, 'Tenterden'),
(873, 'Tetbury'),
(874, 'Tewkesbury'),
(875, 'Thame'),
(876, 'Thatcham'),
(877, 'Thaxted'),
(878, 'Thetford'),
(879, 'Thirsk'),
(880, 'Thornbury'),
(881, 'Thrapston'),
(882, 'Thurso'),
(883, 'Tilbury'),
(884, 'Tillicoultry'),
(885, 'Tipton'),
(886, 'Tiverton'),
(887, 'Tobermory'),
(888, 'Todmorden'),
(889, 'Tonbridge'),
(890, 'Torpoint'),
(891, 'Torquay'),
(892, 'Totnes'),
(893, 'Totton'),
(894, 'Towcester'),
(895, 'Tredegar'),
(896, 'Tregaron'),
(897, 'Tring'),
(898, 'Troon'),
(899, 'Trowbridge'),
(900, 'Truro'),
(901, 'Tunbridge Wells'),
(902, 'Tywyn'),
(903, 'Uckfield'),
(904, 'Ulverston'),
(905, 'Uppingham'),
(906, 'Usk'),
(907, 'Uttoxeter'),
(908, 'Ventnor'),
(909, 'Verwood'),
(910, 'Wadebridge'),
(911, 'Wadhurst'),
(912, 'Wakefield'),
(913, 'Wallasey'),
(914, 'Wallingford'),
(915, 'Walsall'),
(916, 'Waltham Abbey'),
(917, 'Waltham Cross'),
(918, 'Walton on Thames'),
(919, 'Walton on the Naze'),
(920, 'Wantage'),
(921, 'Ware'),
(922, 'Wareham'),
(923, 'Warminster'),
(924, 'Warrenpoint'),
(925, 'Warrington'),
(926, 'Warwick'),
(927, 'Washington'),
(928, 'Watford'),
(929, 'Wednesbury'),
(930, 'Wednesfield'),
(931, 'Wellingborough'),
(932, 'Wellington'),
(933, 'Wells'),
(934, 'Wells next the Sea'),
(935, 'Welshpool'),
(936, 'Welwyn Garden City'),
(937, 'Wem'),
(938, 'Wendover'),
(939, 'West Bromwich'),
(940, 'Westbury'),
(941, 'Westerham'),
(942, 'Westhoughton'),
(943, 'Weston super Mare'),
(944, 'Wetherby'),
(945, 'Weybridge'),
(946, 'Weymouth'),
(947, 'Whaley Bridge'),
(948, 'Whitby'),
(949, 'Whitchurch'),
(950, 'Whitehaven'),
(951, 'Whitley Bay'),
(952, 'Whitnash'),
(953, 'Whitstable'),
(954, 'Whitworth'),
(955, 'Wick'),
(956, 'Wickford'),
(957, 'Widnes'),
(958, 'Wigan'),
(959, 'Wigston'),
(960, 'Wigtown'),
(961, 'Willenhall'),
(962, 'Wincanton'),
(963, 'Winchester'),
(964, 'Windermere'),
(965, 'Winsford'),
(966, 'Winslow'),
(967, 'Wisbech'),
(968, 'Witham'),
(969, 'Withernsea'),
(970, 'Witney'),
(971, 'Woburn'),
(972, 'Woking'),
(973, 'Wokingham'),
(974, 'Wolverhampton'),
(975, 'Wombwell'),
(976, 'Woodbridge'),
(977, 'Woodstock'),
(978, 'Wootton Bassett'),
(979, 'Worcester'),
(980, 'Workington'),
(981, 'Worksop'),
(982, 'Worthing'),
(983, 'Wotton under Edge'),
(984, 'Wrexham'),
(985, 'Wymondham'),
(986, 'Yarm'),
(987, 'Yarmouth'),
(988, 'Yate'),
(989, 'Yateley'),
(990, 'Yeadon'),
(991, 'Yeovil'),
(992, 'York');


SET IDENTITY_INSERT town OFF

GO

--Create Surname table and Populate it


DECLARE @FilePath Varchar(200)
DECLARE @FileName Varchar(12)

SET @FilePath = 'E:\dba\Populate\'

SET @FileName = 'Surnames.csv'

IF OBJECT_ID('Surname','U') IS NOT NULL
BEGIN
DROP TABLE Surname
END

CREATE TABLE Surname(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Surname Varchar(50) NOT NULL UNIQUE
)

--Temp Table
IF OBJECT_ID('tempdb.dbo.#surname','u') IS NOT NULL
BEGIN
DROP TABLE #surname
END

CREATE TABLE #Surname(
Surname Varchar(50) NOT NULL)

declare @sql varchar(max)
set @sql = 'BULK INSERT #Surname FROM ''' + @FilePath + @FileName + ''' WITH (
	ROWTERMINATOR = ''\n''
)'

exec (@sql)

INSERT INTO Surname(surname)
SELECT surname from #Surname
GO

DROP TABLE #Surname
GO

IF OBJECT_ID('dbo.BusinessName','u') IS NOT NULL
BEGIN
DROP TABLE dbo.businessName
END

CREATE Table dbo.BusinessName(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Name Varchar(200) NOT NULL UNIQUE
)

DECLARE @FilePath Varchar(200)
DECLARE @FileName Varchar(50)

SET @FilePath = 'E:\dba\Populate\'

SET @FileName = 'BusinessData.csv'


--Temp object

IF OBJECT_ID('tempdb.dbo.#BusinessName','u') IS NOT NULL
BEGIN
DROP TABLE #businessname
END

CREATE TABLE #businessName(
Name Varchar(100) NOT NULL
)

DECLARE @sql varchar(max)
set @sql = 'BULK INSERT #businessName FROM ''' + @FilePath + @FileName + ''' WITH (
	ROWTERMINATOR = ''\n''
)'

exec (@sql)


INSERT INTO dbo.BusinessName
SELECT Name from #businessName

DROP TABLE #businessName

--Remove double quotes
UPDATE dbo.BusinessName
SET Name = SUBSTRING(Name, 2, LEN(Name))
WHERE LEFT(Name, 1) = '"'

UPDATE dbo.BusinessName
SET Name = SUBSTRING(Name, 1, LEN(Name)-1)
WHERE RIGHT(Name, 1) = '"'

GO

IF OBJECT_ID('dbo.County','u') IS NOT NULL
BEGIN
DROP TABLE dbo.County
END


IF OBJECT_ID('dbo.Country','u') IS NOT NULL
BEGIN
DROP TABLE dbo.COUNTRY
END

CREATE TABLE dbo.Country
(
CountryID int IDENTITY NOT NULL PRIMARY KEY,
Name Varchar(16) NOT NULL UNIQUE
)

SET IDENTITY_INSERT dbo.COUNTRY ON

INSERT INTO dbo.COUNTRY(CountryID, Name)
VALUES(1,'England')
INSERT INTO COUNTRY(CountryID,Name)
VALUES(2,'Wales')
INSERT INTO COUNTRY(CountryID, Name)
VALUES(3,'Scotland')
INSERT INTO COUNTRY(CountryID,Name)
VALUES(4,'Northern Ireland')
GO

SET IDENTITY_INSERT dbo.COUNTRY OFF



CREATE TABLE dbo.County(
  countyID INT IDENTITY NOT NULL PRIMARY KEY,
  county varchar(50) NOT NULL,
  CountryID INT NULL 
) 

--Add Foreign Key
ALTER TABLE dbo.County
ADD CONSTRAINT FK_CountryID
FOREIGN KEY (CountryID) REFERENCES Country(CountryID)

--
-- Dumping data for table 'counties'
--

INSERT INTO dbo.COUNTY (county, CountryID) VALUES
('London',1),
('Bedfordshire',1),
('Buckinghamshire',1),
('Cambridgeshire',1),
('Cheshire',1),
('Cornwall and Isles of Scilly',1),
('Cumbria',1),
('Derbyshire',1),
('Devon',1),
('Dorset',1),
('Durham',1),
('East Sussex',1),
('Essex',1),
('Gloucestershire',1),
('Greater London',1),
('Greater Manchester',1),
('Hampshire',1),
('Hertfordshire',1),
('Kent',1),
('Lancashire',1),
('Leicestershire',1),
('Lincolnshire',1),
('Merseyside',1),
('Norfolk',1),
('North Yorkshire',1),
('Northamptonshire',1),
('Northumberland',1),
('Nottinghamshire',1),
('Oxfordshire',1),
('Shropshire',1),
('Somerset',1),
('South Yorkshire',1),
('Staffordshire',1),
('Suffolk',1),
('Surrey',1),
('Tyne and Wear',1),
('Warwickshire',1),
('West Midlands',1),
('West Sussex',1),
('West Yorkshire',1),
('Wiltshire',1),
('Worcestershire',1),
('Flintshire',2),
('Glamorgan',2),
('Merionethshire',2),
('Monmouthshire',2),
('Montgomeryshire',2),
('Pembrokeshire',2),
('Radnorshire',2),
('Anglesey',2),
('Breconshire',2),
('Caernarvonshire',2),
('Cardiganshire',2),
('Carmarthenshire',2),
('Denbighshire',2),
('Kirkcudbrightshire',3),
('Lanarkshire',3),
('Midlothian',3),
('Moray',3),
('Nairnshire',3),
('Orkney',3),
('Peebleshire',3),
('Perthshire',3),
('Renfrewshire',3),
('Ross & Cromarty',3),
('Roxburghshire',3),
('Selkirkshire',3),
('Shetland',3),
('Stirlingshire',3),
('Sutherland',3),
('West Lothian',3),
('Wigtownshire',3),
('Aberdeenshire',3),
('Angus',3),
('Argyll',3),
('Ayrshire',3),
('Banffshire',3),
('Berwickshire',3),
('Bute',3),
('Caithness',3),
('Clackmannanshire',3),
('Dumfriesshire',3),
('Dumbartonshire',3),
('East Lothian',3),
('Fife',3),
('Inverness',3),
('Kincardineshire',3),
('Kinross-shire',3),
('Antrim',4),
('Armagh',4),
('Down',4),
('Fermanagh',4),
('Londonerry',4),
('Tyrone',4);


GO

USE MockData
GO

IF OBJECT_ID('data.Address','u') IS NOT NULL
BEGIN
DROP TABLE data.Address 
END


CREATE TABLE data.Address(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Address1 VARCHAR(100) NOT NULL,
Town VARCHAR(50) NOT NULL,
County Varchar(50) NOT NULL,
Country Varchar(25) NOT NULL,
POST_CODE Varchar(7) NOT NULL
)
GO


IF OBJECT_ID('data.PostCode','u') IS NOT NULL
BEGIN
DROP TABLE data.PostCode
END

CREATE TABLE data.PostCode(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Name Varchar(7) NOT NULL
)

GO

IF OBJECT_ID('data.ContactDetails','u') IS NOT NULL
BEGIN
DROP TABLE data.ContactDetails
END

CREATE TABLE data.ContactDetails(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Email Varchar(100) NOT NULL,
PhoneNumber INT NOT NULL
)

GO

IF OBJECT_ID('data.PhoneNumber','u') IS NOT NULL
BEGIN
DROP TABLE data.PhoneNumber
END

CREATE TABLE data.PhoneNumber(
ID INT IDENTITY NOT NULL PRIMARY KEY,
PhoneNumber CHAR(10) NOT NULL
CONSTRAINT chk_number CHECK (PhoneNumber LIKE '[0][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

GO

IF OBJECT_ID('data.EmailAddress','u') IS NOT NULL
BEGIN
DROP TABLE data.EmailAddress
END

CREATE TABLE data.EmailAddress(
ID INT NOT NULL PRIMARY KEY,
Email varchar(50) NOT NULL
CONSTRAINT chk_email CHECK (email LIKE '_%@__%.__%')
)

GO


IF OBJECT_ID('dbo.Title','u') IS NOT NULL
BEGIN
DROP TABLE dbo.title 
END

CREATE TABLE dbo.title(
ID INT IDENTITY NOT NULL PRIMARY KEY,
TITLE varchar(4) NOT NULL UNIQUE, 
GENDER CHAR(1) NOT NULL 
CONSTRAINT ck_genderTitle CHECK (GENDER IN ('M','F','B')) --B = Both
)
GO

INSERT INTO dbo.title(title, gender)
VALUES
('Mr','M'),
('Miss','F'),
('Mrs','F'),
('Ms','F'),
('Dr','B'),
('Rev','B'),
('Hon','B'),
('Dame','F'),
('Sir','M') 

GO

IF OBJECT_ID('data.MaleIndividual','u') IS NOT NULL
BEGIN
DROP TABLE data.MaleIndividual
END

CREATE TABLE [Data].[MaleIndividual](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[EmailAddress] [Varchar](50) NOT NULL
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

IF OBJECT_ID('data.FemaleIndividual','u') IS NOT NULL
BEGIN
DROP TABLE data.FemaleIndividual
END

CREATE TABLE [Data].[FemaleIndividual](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[EmailAddress] [Varchar](50) NOT NULL
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--FirstNames for both Male and Female

DECLARE @FilePath Varchar(200)
DECLARE @FileName Varchar(50)

SET @FilePath = 'E:\dba\Populate\'

SET @FileName = 'male.firstnames.csv'

IF OBJECT_ID('dbo.FirstNames','U') IS NOT NULL
BEGIN
DROP TABLE dbo.FirstNames
END

CREATE TABLE dbo.FirstNames(
ID INT IDENTITY NOT NULL PRIMARY KEY,
Name Varchar(50) NOT NULL,
GENDER CHAR(1) NOT NULL
CONSTRAINT ck_gender CHECK (GENDER IN ('M','F'))
)

--Temp Tables
IF OBJECT_ID('tempdb.dbo.#maleFirstNames','u') IS NOT NULL
BEGIN
DROP TABLE #maleFirstNames
END

CREATE TABLE #maleFirstNames(
Name Varchar(50) NOT NULL)

--Temp Table
IF OBJECT_ID('tempdb.dbo.#FemaleFirstNames','u') IS NOT NULL
BEGIN
DROP TABLE #FemaleFirstNames
END

CREATE TABLE #FemaleFirstNames(
Name Varchar(50) NOT NULL)


declare @sql varchar(max)
set @sql = 'BULK INSERT #maleFirstNames FROM ''' + @FilePath + @FileName + ''' WITH (
	ROWTERMINATOR = ''\n''
)'

exec (@sql)


SET @FileName = 'Female.firstnames.csv'


set @sql = 'BULK INSERT #FemaleFirstNames FROM ''' + @FilePath + @FileName + ''' WITH (
	ROWTERMINATOR = ''\n''
)'

exec (@sql)

INSERT INTO dbo.FirstNames(name, GENDER)
SELECT name, 'M' from #maleFirstNames
GO

INSERT INTO dbo.FirstNames(name, GENDER)
SELECT name, 'F' from #FemaleFirstNames
GO

DROP TABLE #maleFirstNames
DROP TABLE #FemaleFirstNames
GO