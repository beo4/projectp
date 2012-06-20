package projektp.asset



import org.junit.*
import grails.test.mixin.*

@TestFor(AssetTypeController)
@Mock(AssetType)
class AssetTypeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/assetType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.assetTypeInstanceList.size() == 0
        assert model.assetTypeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.assetTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.assetTypeInstance != null
        assert view == '/assetType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/assetType/show/1'
        assert controller.flash.message != null
        assert AssetType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/assetType/list'


        populateValidParams(params)
        def assetType = new AssetType(params)

        assert assetType.save() != null

        params.id = assetType.id

        def model = controller.show()

        assert model.assetTypeInstance == assetType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/assetType/list'


        populateValidParams(params)
        def assetType = new AssetType(params)

        assert assetType.save() != null

        params.id = assetType.id

        def model = controller.edit()

        assert model.assetTypeInstance == assetType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/assetType/list'

        response.reset()


        populateValidParams(params)
        def assetType = new AssetType(params)

        assert assetType.save() != null

        // test invalid parameters in update
        params.id = assetType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/assetType/edit"
        assert model.assetTypeInstance != null

        assetType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/assetType/show/$assetType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        assetType.clearErrors()

        populateValidParams(params)
        params.id = assetType.id
        params.version = -1
        controller.update()

        assert view == "/assetType/edit"
        assert model.assetTypeInstance != null
        assert model.assetTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/assetType/list'

        response.reset()

        populateValidParams(params)
        def assetType = new AssetType(params)

        assert assetType.save() != null
        assert AssetType.count() == 1

        params.id = assetType.id

        controller.delete()

        assert AssetType.count() == 0
        assert AssetType.get(assetType.id) == null
        assert response.redirectedUrl == '/assetType/list'
    }
}
