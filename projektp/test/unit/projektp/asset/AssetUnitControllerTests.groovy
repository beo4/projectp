package projektp.asset



import org.junit.*
import grails.test.mixin.*

@TestFor(AssetUnitController)
@Mock(AssetUnit)
class AssetUnitControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/assetUnit/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.assetUnitInstanceList.size() == 0
        assert model.assetUnitInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.assetUnitInstance != null
    }

    void testSave() {
        controller.save()

        assert model.assetUnitInstance != null
        assert view == '/assetUnit/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/assetUnit/show/1'
        assert controller.flash.message != null
        assert AssetUnit.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/assetUnit/list'


        populateValidParams(params)
        def assetUnit = new AssetUnit(params)

        assert assetUnit.save() != null

        params.id = assetUnit.id

        def model = controller.show()

        assert model.assetUnitInstance == assetUnit
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/assetUnit/list'


        populateValidParams(params)
        def assetUnit = new AssetUnit(params)

        assert assetUnit.save() != null

        params.id = assetUnit.id

        def model = controller.edit()

        assert model.assetUnitInstance == assetUnit
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/assetUnit/list'

        response.reset()


        populateValidParams(params)
        def assetUnit = new AssetUnit(params)

        assert assetUnit.save() != null

        // test invalid parameters in update
        params.id = assetUnit.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/assetUnit/edit"
        assert model.assetUnitInstance != null

        assetUnit.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/assetUnit/show/$assetUnit.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        assetUnit.clearErrors()

        populateValidParams(params)
        params.id = assetUnit.id
        params.version = -1
        controller.update()

        assert view == "/assetUnit/edit"
        assert model.assetUnitInstance != null
        assert model.assetUnitInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/assetUnit/list'

        response.reset()

        populateValidParams(params)
        def assetUnit = new AssetUnit(params)

        assert assetUnit.save() != null
        assert AssetUnit.count() == 1

        params.id = assetUnit.id

        controller.delete()

        assert AssetUnit.count() == 0
        assert AssetUnit.get(assetUnit.id) == null
        assert response.redirectedUrl == '/assetUnit/list'
    }
}
