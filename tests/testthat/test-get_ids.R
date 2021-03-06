# tests for get_ids fxn in taxize
context("get_ids")

tt <- get_ids(names="Chironomus riparius", db = 'ncbi', verbose=FALSE)

test_that("get_ids returns the correct value", {
  expect_equal(tt[[1]][[1]], "315576")
})

test_that("get_ids returns the correct class", {
  expect_that(tt, is_a("ids"))
  expect_that(tt[[1]], is_a("uid"))
  expect_that(tt[[1]][[1]], is_a("character"))
})

test_that("get_ids accepts ask and verbose arguments", {
  expect_that(is.na(get_ids(names="Poa annua", db = 'eol', ask=FALSE)[[1]][[1]]), 
              is_true())
  expect_message(get_ids(names="Poa annua", db = 'ncbi'))
  expect_that(get_ids(names="Poa annua", db = 'ncbi', verbose=FALSE), not(shows_message()))
})

nn <- c('Imperata brasiliensis','Hylebates cordatus','Apocopis intermedius',
        'Paspalum subciliatum','Bromus nottowayanus','Chimonobambusa marmorea',
        'Panicum adenophorum','Otatea glauca','Himalayacalamus falconeri',
        'Briza lamarckiana','Trisetum turcicum','Brachiaria subulifolia',
        'Boissiera squarrosa','Arthrostylidium pubescens','Neyraudia reynaudiana'
        ,'Bromus gunckelii','Poa sudicola','Pentameris thuarii',
        'Calamagrostis inexpansa','Willkommia texana','Helictotrichon cantabricum',
        'Muhlenbergia tenuifolia','Sporobolus ioclados','Bambusa cerosissima',
        'Axonopus flabelliformis','Glyceria lithuanica','Pentaschistis malouinensis',
        'Perrierbambus madagascariensis','Hierochloe alpina','Hemarthria compressa',
        'Zizania latifolia','Festuca altaica','Gigantochloa wrayi','Festuca alpina',
        'Aegilops caudata','Elymus cognatus','Agrostis gracililaxa','Gymnopogon foliosus')

test_that("works on a variety of names", {
  expect_that(get_ids(nn[13], db = c('ncbi','itis','col','eol','tropicos'), ask=FALSE), is_a("ids"))
  expect_that(get_ids(nn[14], db = c('ncbi','itis','col','eol','tropicos'), ask=FALSE), is_a("ids"))
  expect_that(get_ids(nn[15], db = c('ncbi','itis','col','eol','tropicos'), ask=FALSE), is_a("ids"))
  expect_that(get_ids(nn[16], db = c('ncbi','itis','col','eol','tropicos'), ask=FALSE), is_a("ids"))
  expect_that(get_ids(nn[17], db = c('ncbi','itis','col','eol','tropicos'), ask=FALSE), is_a("ids"))
  expect_that(get_ids(nn[18], db = c('ncbi','itis','col','eol','tropicos'), ask=FALSE), is_a("ids"))
  expect_that(get_ids(nn[19], db = c('ncbi','itis','col','eol','tropicos'), ask=FALSE), is_a("ids"))
})