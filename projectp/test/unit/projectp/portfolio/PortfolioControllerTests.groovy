package projectp.portfolio



import org.junit.*
import grails.test.mixin.*

@TestFor(PortfolioController)
@Mock(Portfolio)
class PortfolioControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/portfolio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.portfolioInstanceList.size() == 0
        assert model.portfolioInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.portfolioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.portfolioInstance != null
        assert view == '/portfolio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/portfolio/show/1'
        assert controller.flash.message != null
        assert Portfolio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/portfolio/list'


        populateValidParams(params)
        def portfolio = new Portfolio(params)

        assert portfolio.save() != null

        params.id = portfolio.id

        def model = controller.show()

        assert model.portfolioInstance == portfolio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/portfolio/list'


        populateValidParams(params)
        def portfolio = new Portfolio(params)

        assert portfolio.save() != null

        params.id = portfolio.id

        def model = controller.edit()

        assert model.portfolioInstance == portfolio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/portfolio/list'

        response.reset()


        populateValidParams(params)
        def portfolio = new Portfolio(params)

        assert portfolio.save() != null

        // test invalid parameters in update
        params.id = portfolio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/portfolio/edit"
        assert model.portfolioInstance != null

        portfolio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/portfolio/show/$portfolio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        portfolio.clearErrors()

        populateValidParams(params)
        params.id = portfolio.id
        params.version = -1
        controller.update()

        assert view == "/portfolio/edit"
        assert model.portfolioInstance != null
        assert model.portfolioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/portfolio/list'

        response.reset()

        populateValidParams(params)
        def portfolio = new Portfolio(params)

        assert portfolio.save() != null
        assert Portfolio.count() == 1

        params.id = portfolio.id

        controller.delete()

        assert Portfolio.count() == 0
        assert Portfolio.get(portfolio.id) == null
        assert response.redirectedUrl == '/portfolio/list'
    }
}
